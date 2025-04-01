//
//  MultipeerManager.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

import SwiftUI
import MultipeerConnectivity

class MultipeerManager: NSObject, ObservableObject {
    private let serviceType = "kanakkas-game"
    let myPeerID: MCPeerID
    private var session: MCSession
    private var advertiser: MCNearbyServiceAdvertiser?
    private var browser: MCNearbyServiceBrowser?
    
    @Published var connectedPeers: [MCPeerID] = []
    @Published var playerNicknames: [MCPeerID: String] = [:]
    @Published var hostNickname: String = ""
    @Published var availableHosts: [MCPeerID] = []
    @Published var hostNicknames: [MCPeerID: String] = [:]
    @Published var isHosting = false
    @Published var isConnected = false // ✅ Track when a player joins
    @Published var isHost = false
    
    override init() {
        self.myPeerID = MCPeerID(displayName: UIDevice.current.name)
        self.session = MCSession(peer: myPeerID, securityIdentity: nil, encryptionPreference: .none)
        super.init()
        self.session.delegate = self
    }
    
    // 🔹 Start Hosting
    func startHosting(nickname: String) {
        self.hostNickname = nickname
        self.playerNicknames[myPeerID] = nickname
        self.isHost = true // ✅ Mark as host

        advertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: ["nickname": nickname], serviceType: serviceType)
        advertiser?.delegate = self
        advertiser?.startAdvertisingPeer()
    }
    
    // 🔹 Start Browsing
    func startBrowsing() {
        browser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: serviceType)
        browser?.delegate = self
        browser?.startBrowsingForPeers()
    }
    
    // 🔹 Join Game (Sends nickname to the host)
    func joinGame(nickname: String, host: MCPeerID) {
        playerNicknames[myPeerID] = nickname
        
        let context = nickname.data(using: .utf8) // Send nickname to host
        browser?.invitePeer(host, to: session, withContext: context, timeout: 10)
    }
}

// MARK: - Advertiser Delegate (Host receives invitations)
extension MultipeerManager: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        if let context = context, let nickname = String(data: context, encoding: .utf8) {
            DispatchQueue.main.async {
                self.playerNicknames[peerID] = nickname
            }
        }
        
        invitationHandler(true, self.session)

        // ✅ Update all players after a new one joins
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.updateAllPlayers()
        }
    }
}



// MARK: - Browser Delegate (Client discovers hosts)
extension MultipeerManager: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String: String]?) {
        DispatchQueue.main.async {
            self.availableHosts.append(peerID)
            self.hostNicknames[peerID] = info?["nickname"] ?? peerID.displayName
        }
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        DispatchQueue.main.async {
            self.availableHosts.removeAll { $0 == peerID }
        }
    }
}

// MARK: - MCSession Delegate (Handles connections)
extension MultipeerManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
            DispatchQueue.main.async {
                self.connectedPeers = session.connectedPeers
                self.isConnected = !self.connectedPeers.isEmpty
                
                // 🔹 If a player disconnects, update player list
                if state == .connected {
                    self.updateAllPlayers()
                }
                
                // 🔴 If the host disconnects, notify all players
                if self.isHost && state == .notConnected {
                    self.notifyPlayersToExit()
                }
            }
        }
    
    func notifyPlayersToExit() {
            do {
                let exitMessage = "EXIT_LOBBY"
                let data = exitMessage.data(using: .utf8)!
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error sending exit message: \(error.localizedDescription)")
            }
        }
    
    func updateAllPlayers() {
        var syncData = [String: String]()
        
        // ✅ Ensure host is added only once
        if isHost {
            syncData["HOST"] = hostNickname
        }

        for (peer, nickname) in playerNicknames {
            syncData[peer.displayName] = nickname
        }

        print("🟢 Sending update to players: \(syncData)") // Debugging output

        do {
            let data = try JSONEncoder().encode(syncData)
            try session.send(data, toPeers: session.connectedPeers, with: .reliable)
        } catch {
            print("🔴 Error sending player list: \(error.localizedDescription)")
        }
    }
    
    // 🔹 Required but not used - Can be left empty
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        // Check if the received data is an "EXIT_LOBBY" message
        if let message = String(data: data, encoding: .utf8), message == "EXIT_LOBBY" {
            DispatchQueue.main.async {
                self.isConnected = false // ✅ This will trigger navigation away from the lobby
                print("🔴 Host has left the game. Returning to main menu.")
            }
            return // ✅ Exit function early (prevents further processing)
        }

        // Otherwise, attempt to decode it as a nickname update
        if let receivedNicknames = try? JSONDecoder().decode([String: String].self, from: data) {
            DispatchQueue.main.async {
                print("🟡 Received update: \(receivedNicknames)") // Debugging output

                if let host = receivedNicknames["HOST"], !host.isEmpty {
                    self.hostNickname = host // ✅ Ensure the host's name is always updated
                }

                self.playerNicknames = [:] // ✅ Clear old data before updating

                for (peerName, nickname) in receivedNicknames where peerName != "HOST" {
                    if let peer = self.connectedPeers.first(where: { $0.displayName == peerName }) {
                        self.playerNicknames[peer] = nickname
                    }
                }

                print("🟢 Updated player list: \(self.playerNicknames)")
            }
        }
    }
    
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        // Required but not needed for this implementation
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        // Required but not needed for this implementation
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        // Required but not needed for this implementation
    }
}


