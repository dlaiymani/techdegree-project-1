// Creation of the data collection
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


// Function that create the letters for the players of a team
func letter(teamName: String, teamPractiseDate: String, teamArray: [[String: Any]]) -> [String] {
    var letter: [String] = []
    for player in teamArray {
        if let guardians = player["Guardian"], let name = player["Name"] {
            letter += [
                """
                --------------------------------------------------------------
                Dear \(guardians)
                We are pleased to announce you that \(name) has been affected to the \(teamName) team.
                The first team practise date/time is set to \(teamPractiseDate)
                --------------------------------------------------------------
                """]
        }
    }
    return letter
}

// Function that return the number of experienced player in a team
func nbOfExperienced(team: [[String: Any]]) -> Int {
    var sum = 0
    for player in players {
        let isExperienced = player["Experience"] as! Bool
        if  isExperienced == true {
            sum += 1
        }
    }
    return sum
}

// Function that return the average player's height of a team
func averageHeight(team: [[String: Any]]) -> Double {
    var sum = 0
    var nb = 0
    for player in team {
        sum += player["Height"] as! Int
        nb += 1
    }
    if nb > 0 {
        return Double(sum / nb)
    } else {
        return -1
    }
}


// Main

// Spliting the players in two groups: experienced and non experienced
var teamExperienced: [[String: Any]] = []
var teamNonExperienced: [[String: Any]] = []
for player in players {
    let isExperienced = player["Experience"] as! Bool
    if isExperienced == true {
        teamExperienced.append(player)
    } else {
        teamNonExperienced.append(player)
    }
}


// sorting the two groups in order to balance their repartition in height and in experiences
teamExperienced.sort{
        (($0 as! Dictionary<String, Any>)["Height"] as! Int) > (($1 as! Dictionary<String, Any>)["Height"] as! Int)
}

teamNonExperienced.sort{
    (($0 as! Dictionary<String, Any>)["Height"] as! Int) > (($1 as! Dictionary<String, Any>)["Height"] as! Int)
}


// Moving the players into their respective teams such that the heights and the experience are balanced.
var i = 0
var j = teamExperienced.count-1

while i < j {
    teamSharks.append(teamExperienced[i])
    teamSharks.append(teamExperienced[j])
    teamDragons.append(teamExperienced[i+1])
    teamDragons.append(teamExperienced[j-1])
    teamRaptors.append(teamExperienced[i+2])
    teamRaptors.append(teamExperienced[j-2])
    i += 3
    j -= 3
}

i = 0
j = teamNonExperienced.count-1

while i < j {
    teamSharks.append(teamNonExperienced[i])
    teamSharks.append(teamNonExperienced[j])
    teamDragons.append(teamNonExperienced[i+1])
    teamDragons.append(teamNonExperienced[j-1])
    teamRaptors.append(teamNonExperienced[i+2])
    teamRaptors.append(teamNonExperienced[j-2])
    i += 3
    j -= 3
}

// Printing information about the teams
print("Team Sharks: Average Height: \(averageHeight(team: teamSharks)) - Number of Experienced players: \(nbOfExperienced(team: teamSharks)) ")
print("Team Dragons: Average Height: \(averageHeight(team: teamDragons)) - Number of Experienced players: \(nbOfExperienced(team: teamDragons)) ")
print("Team Raptors: Average Height: \(averageHeight(team: teamRaptors)) - Number of Experienced players: \(nbOfExperienced(team: teamRaptors)) ")

    
    
// Creation of the lettres collection that contains all the letters
var letters = letter(teamName: "Sharks", teamPractiseDate: "March 17, 1pm", teamArray: teamSharks) +
               letter(teamName: "Dragons", teamPractiseDate: "March 17, 3pm", teamArray: teamDragons) +
                letter(teamName: "Raptors", teamPractiseDate: "March 18, 1pm", teamArray: teamRaptors)

// Printing the letters
for letter in letters {
    print()
    print(letter)
}


