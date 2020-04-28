//
//  ViewController.swift
//  Movie_Pick
//
//  Created by Willie Benavides on 3/26/20.
//  Copyright © 2020 Willie Benavides. All rights reserved.
//  Disclaimer: This App, Pick A Flick, is developed as an educational project. Certain materials are included under the fair use exemption of the U.S. Copyright Law and have been prepared according to the multimedia fair use guidelines and are restricted from further use.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var movieWelcomeSound: AVAudioPlayer!
    var movieTrailerSound: AVAudioPlayer!
    
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblYear: UILabel!
    
    @IBOutlet weak var lblGenre: UILabel!
    
    @IBOutlet weak var imgMoviePicture: UIImageView!
    var MovieArray = [MoviePicker] ()
    
    @IBOutlet weak var lblName: UILabel!
    
    func setLabels() {
        let randomMovie = MovieArray.randomElement()
        lblName.text = randomMovie!.MovieName
        
        let img = UIImage(named: randomMovie!.MoviePicture)
        imgMoviePicture.image = img
        
        lblGenre.text = "Genre: \(randomMovie!.MovieGenre)"
        lblYear.text = "Year: \(randomMovie!.MovieYear)"
        
        selectedSite = randomMovie!.MovieSiteUrl
        imgMoviePicture.contentMode = .scaleAspectFit
        movieWelcomeSound.play()
        lblDescription.text = randomMovie!.MovieDescription
        
        if lblDescription.alpha == 0 {
            UIView.animate(withDuration: 1.5,
                           animations: {
                            self.lblName.alpha = 1.0
                            self.imgMoviePicture.alpha = 1.0
                             self.lblDescription.alpha = 1.0
                             self.lblYear.alpha = 1.0
                             self.lblGenre.alpha = 1.0
            })
        }
    
    
    
    }
    
    func playSound() {
        movieTrailerSound.play()
    }
    
    
    var selectedSite = ""
    
    @IBAction func btnTrailer(_ sender: Any) {
        let app = UIApplication.shared
        if selectedSite == "" {
            selectedSite = "http://youtube.com/"
        }
        let urlAddress = selectedSite
        let urlw = URL(string:urlAddress)
        app.open(urlw!)
        playSound()
    }
    
    @IBAction func btnPick(_ sender: Any) {
        setLabels()
    }
    
    var Movies = ["The Godfather","Fast and Furious", "Black Panther", "The Hangover", "Barbershop", "Avatar", "Superbad", "Borat", "Shrek", "Colombiana" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieWelcomeSound = try?
            AVAudioPlayer(contentsOf:  URL(fileURLWithPath:Bundle.main.path(forResource: "Click sound", ofType: "wav")!))
        
        movieTrailerSound = try?
            AVAudioPlayer(contentsOf:  URL(fileURLWithPath:Bundle.main.path(forResource: "TSound", ofType: "wav")!))
        
        populateMovie()
        setLabels()
    }
    
    func populateMovie () {
        
        let mov1 = MoviePicker()
        mov1.MovieName = "The Godfather"
        mov1.MoviePicture =  "godfather.jpg"
        mov1.MovieGenre = "Action"
        mov1.MovieYear = 1972
        mov1.MovieSiteUrl = "https://www.youtube.com/watch?v=CWoQlDlyQj4"
        mov1.MovieDescription = "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."
        MovieArray.append(mov1)
        
        let mov2 = MoviePicker()
        mov2.MovieName = "Fast and Furious"
        mov2.MoviePicture =  "ff.jpg"
        mov2.MovieGenre = "Action/Drama"
        mov2.MovieYear = 2009
        mov2.MovieSiteUrl = "https://www.youtube.com/watch?v=2TAOizOnNPo"
        mov2.MovieDescription = "Brian O'Conner, back working for the FBI in Los Angeles, teams up with Dominic Toretto to bring down a heroin importer by infiltrating his operation."
        MovieArray.append(mov2)
        
        let mov3 = MoviePicker()
        mov3.MovieName = "Black Panther"
        mov3.MoviePicture =  "BlackPanther.jpg"
        mov3.MovieGenre = "Action/Adventure"
        mov3.MovieYear = 2018
        mov3.MovieSiteUrl = "https://www.youtube.com/watch?v=dxWvtMOGAhw"
        mov3.MovieDescription = "T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country's past."
        MovieArray.append(mov3)
        
        let mov4 = MoviePicker()
        mov4.MovieName = "The Hangover"
        mov4.MoviePicture =  "theHangover.jpg"
        mov4.MovieGenre = "Comedy/Action"
        mov4.MovieYear = 2009
        mov4.MovieSiteUrl = "https://www.youtube.com/watch?v=tlize92ffnY"
        mov4.MovieDescription = "Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding."
        MovieArray.append(mov4)
        
        let mov5 = MoviePicker()
        mov5.MovieName = "Barbershop"
        mov5.MoviePicture =  "barbershop.jpg"
        mov5.MovieGenre = "Drama"
        mov5.MovieYear = 2002
        mov5.MovieSiteUrl = "https://www.youtube.com/watch?v=BH5kMAHANr0"
        mov5.MovieDescription = "An ensemble comedy about a day in the life of a barbershop on the south side of Chicago. It's Calvin's shop, and he inherited the struggling business from his father, but with bills to pay and a baby on the way, he sees the shop as a burden and a waste of time."
        MovieArray.append(mov5)
        
        let mov6 = MoviePicker()
        mov6.MovieName = "Avatar"
        mov6.MoviePicture =  "avatar.jpg"
        mov6.MovieGenre = "Sci-fi Action"
        mov6.MovieYear = 2009
        mov6.MovieSiteUrl = "https://www.youtube.com/watch?v=6ziBFh3V1aM"
        mov6.MovieDescription = "A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home."
        MovieArray.append(mov6)
        
        let mov7 = MoviePicker()
        mov7.MovieName = "Superbad"
        mov7.MoviePicture =  "superbad.jpg"
        mov7.MovieGenre = "Comedy"
        mov7.MovieYear = 2007
        mov7.MovieSiteUrl = "https://www.youtube.com/watch?v=4eaZ_48ZYog"
        mov7.MovieDescription = "Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry."
        MovieArray.append(mov7)
        
        let mov8 = MoviePicker()
        mov8.MovieName = "Borat"
        mov8.MoviePicture =  "borat.jpg"
        mov8.MovieGenre = "Comedy"
        mov8.MovieYear = 2006
        mov8.MovieSiteUrl = "https://www.youtube.com/watch?v=j4W51ndJ8Mc"
        mov8.MovieDescription = "Kazakh TV talking head Borat is dispatched to the United States to report on the greatest country in the world. With a documentary crew in tow, Borat becomes more interested in locating and marrying Pamela Anderson."
        MovieArray.append(mov8)
        
        let mov9 = MoviePicker()
        mov9.MovieName = "Shrek"
        mov9.MoviePicture =  "shrek.jpg"
        mov9.MovieGenre = "Animation"
        mov9.MovieYear = 2001
        mov9.MovieSiteUrl = "https://www.youtube.com/watch?v=CwXOrWvPBPk"
        mov9.MovieDescription = "A mean lord exiles fairytale creatures to the swamp of a grumpy ogre, who must go on a quest and rescue a princess for the lord in order to get his land back."
        MovieArray.append(mov9)
        
        let mov10 = MoviePicker()
        mov10.MovieName = "Colombiana"
        mov10.MoviePicture =  "colombiana.jpg"
        mov10.MovieGenre = "Action"
        mov10.MovieYear = 2011
        mov10.MovieSiteUrl = "https://www.youtube.com/watch?v=HCxPLlFWdFo"
        mov10.MovieDescription = "A young woman, after witnessing her parents' murder as a child in Bogota, grows up to be a stone-cold assassin. "
        MovieArray.append(mov10)
        
    }
    
        func setTrans() {
            lblGenre.alpha = 0
            lblName.alpha = 0
            lblYear.alpha = 0
            lblDescription.alpha = 0
            imgMoviePicture.alpha = 0
        }
    
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setTrans()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        setLabels()
        playSound()
        
    }
    
    
    
    
    
}

