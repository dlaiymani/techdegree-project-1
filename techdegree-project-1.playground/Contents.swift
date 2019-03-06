let player1: [String: Any] = ["Name": "Joe Smith", "Height": 42, "Experience": true, "Guardian": "Jim and Jan Smith" ]
let player2: [String: Any] = ["Name": "Jill Tanner", "Height": 36, "Experience": true, "Guardian": "Clara Tanner" ]
let player3: [String: Any] = ["Name": "Bill Bon", "Height": 43, "Experience": true, "Guardian": "Sara and Jenny Bon" ]
let player4: [String: Any] = ["Name": "Eva Gordon", "Height": 45, "Experience": false, "Guardian": "Wendy and Mike Gordon" ]
let player5: [String: Any] = ["Name": "Matt Gill", "Height": 40, "Experience": false, "Guardian": "Charles and Sylvia Gill" ]
let player6: [String: Any] = ["Name": "Kimmy Stein", "Height": 41, "Experience": false, "Guardian": "Bill and Hillary Stein" ]
let player7: [String: Any] = ["Name": "Sammy Adams", "Height": 45, "Experience": false, "Guardian": "Jeff Adams" ]
let player8: [String: Any] = ["Name": "Karl Saygan", "Height": 42, "Experience": true, "Guardian": "Heather Bledsoe" ]
let player9: [String: Any] = ["Name": "Suzane Greenberg", "Height": 44, "Experience": true, "Guardian": "Henrietta Dumas" ]
let player10: [String: Any] = ["Name": "Sal Dali", "Height": 41, "Experience": false, "Guardian": "Gala Dali" ]
let player11: [String: Any] = ["Name": "Joe Kavalier", "Height": 39, "Experience": false, "Guardian": "Sam and Elaine Kavalier" ]
let player12: [String: Any] = ["Name": "Ben Finkelstein", "Height": 44, "Experience": false, "Guardian": "Aaron and Jill Finkelstein" ]
let player13: [String: Any] = ["Name": "Diego Soto", "Height": 41, "Experience": true, "Guardian": "Robin and Sarika Soto" ]
let player14: [String: Any] = ["Name": "Chloe Alaska", "Height": 47, "Experience": false, "Guardian": "David and Jamie Alaska" ]
let player15: [String: Any] = ["Name": "Arnold Willis", "Height": 43, "Experience": false, "Guardian": "Claire Willis" ]
let player16: [String: Any] = ["Name": "Phillip Helm", "Height": 44, "Experience": true, "Guardian": "Thomas Helm and Eva Jones" ]
let player17: [String: Any] = ["Name": "Les Clay", "Height": 42, "Experience": true, "Guardian": "Wynonna Brown" ]
let player18: [String: Any] = ["Name": "Herschel Krustofski", "Height": 45, "Experience": true, "Guardian": "Hyman and Rachel Krustofski" ]

let players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18,]

var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

func putPlayer(_ player: [String: Any], in teamNumber: Int) {
    switch teamNumber {
        case 0:
            teamSharks += [player]
        case 1:
            teamDragons += [player]
        default:
            teamRaptors += [player]
    }
}

func printTeam(_ team: [[String: Any]]) {
    for player in team {
        print("\(player["Name"]) - \(player["Experience"])")
    }
}
var numTeamExperienced = 0
var numTeamNonExperienced = 0
var teamExperienced: [[String: Any]] = []
for player in players {
    let isExperienced = player["Experience"] as! Bool
    if isExperienced == true {
        putPlayer(player, in: numTeamExperienced)
        numTeamExperienced = (numTeamExperienced + 1) % 3
    } else {
        putPlayer(player, in: numTeamNonExperienced)
        numTeamNonExperienced = (numTeamNonExperienced + 1) % 3
    }
}

printTeam(teamRaptors)


