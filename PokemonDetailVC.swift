//
//  PokemonDetailVC.swift
//  PokémonV1
//
//  Created by Raffi Gaëtan on 08/08/2016.
//  Copyright © 2016 Raffi Gaëtan. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabe: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var evolutionText: UILabel!
    @IBOutlet weak var currentLevelImg: UIImageView!
    @IBOutlet weak var nextLevelImg: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentLevelImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            //Will be called after download is done
            
        }
    }
    
    func upDateUI() {
        descriptionLabe.text = pokemon.description
        TypeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        baseAttackLabel.text = pokemon.attack
        nextLevelImg.image = UIImage(named: pokemon.nextEvolutionId)
        baseAttackLabel.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            evolutionText.text = "No more evolution :( "
            nextLevelImg.hidden = true
        } else {
            nextLevelImg.hidden = false
            nextLevelImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLevel != "" {
                str += "- LVL \(pokemon.nextEvolutionLevel)"
                
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
