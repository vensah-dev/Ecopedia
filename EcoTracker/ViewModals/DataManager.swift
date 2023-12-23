//
//  GlobalVars.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import Foundation
import SwiftUI

struct Suggestion: Identifiable{
    
    var id = UUID()
    var title: String
    var detail: String = "test" 
    
}

struct Challenge: Codable, Equatable{
    var id = UUID()
    var title: String = ""
    var difficulty: String = ""
    var description: String = "test"
    var completed: Bool = false

    
}



class DataManager: ObservableObject {
    
    @Published public var Suggestions: [Suggestion] = [
        Suggestion(
            title: "Reduce Energy Usage",
            detail: "Turn off lights and appliances when not in use to save energy and reduce your carbon footprint. Unplug chargers and electronic devices that are not in use, as they can still draw power even when turned off."
        ),
        Suggestion(
            title: "Carpool or Use Public Transport",
            detail: "Opt for carpooling or public transportation to reduce emissions and air pollution. Carpooling with others or using buses, trains, or subways can help reduce the number of vehicles on the road, which lowers traffic congestion and greenhouse gas emissions."
        ),
        Suggestion(
            title: "Recycle Paper and Cardboard",
            detail: "Recycle paper and cardboard products to save trees and reduce waste. Separate paper and cardboard from your regular trash and place them in recycling bins. Recycling paper reduces the need to cut down more trees for paper production and minimizes landfill waste."
        ),
        Suggestion(
            title: "Use Reusable Bags",
            detail: "Bring your own reusable bags when shopping to reduce the use of single-use plastic bags. Many stores offer reusable bags for purchase, and some even provide discounts to customers who bring their own bags. Using reusable bags reduces plastic waste and pollution."
        ),
        Suggestion(
            title: "Conserve Water",
            detail: "Fix leaks, take shorter showers, and use water-saving appliances to conserve water resources. Repairing leaky faucets and pipes prevents water wastage. Reducing shower time and installing low-flow toilets and showerheads can significantly decrease water consumption."
        ),
        Suggestion(
            title: "Reduce Meat Consumption",
            detail: "Eating less meat or opting for plant-based meals can lower your carbon footprint. Livestock farming generates significant greenhouse gas emissions. Consider incorporating more plant-based foods into your diet to reduce the environmental impact of meat production."
        ),
        Suggestion(
            title: "Compost Organic Waste",
            detail: "Composting food scraps and yard waste reduces landfill waste and enriches soil. Create a compost pile or use a composting bin to turn organic waste into nutrient-rich compost. Compost can be used to improve soil quality in gardens and reduce the need for chemical fertilizers."
        ),
        Suggestion(
            title: "Choose Energy-Efficient Appliances",
            detail: "Upgrade to energy-efficient appliances to save on electricity and reduce emissions. Look for appliances with the ENERGY STAR label, which indicates that they meet energy efficiency standards. Energy-efficient appliances consume less electricity, resulting in lower energy bills and reduced environmental impact."
        ),
        Suggestion(
            title: "Support Renewable Energy",
            detail: "Switch to a renewable energy provider or install solar panels to reduce reliance on fossil fuels. Renewable energy sources like wind, solar, and hydroelectric power generate electricity with minimal greenhouse gas emissions. Transitioning to renewable energy helps combat climate change."
        ),
        Suggestion(
            title: "Plant Trees",
            detail: "Planting trees helps offset carbon emissions and supports biodiversity. Trees absorb carbon dioxide from the atmosphere and release oxygen. They also provide habitat for wildlife. Participate in tree-planting programs or plant trees in your own backyard to contribute to reforestation efforts."
        ),
        Suggestion(
            title: "Reduce Plastic Use",
            detail: "Minimize plastic waste by using reusable water bottles, avoiding single-use plastic cutlery and straws, and choosing products with minimal plastic packaging."
        ),
        Suggestion(
            title: "Use Energy-Efficient Lighting",
            detail: "Replace incandescent bulbs with energy-efficient LED or CFL bulbs. They use less energy and last longer, reducing the need for frequent replacements."
        ),
        Suggestion(
            title: "Practice Sustainable Gardening",
            detail: "Use native plants, mulch, and natural pest control methods in your garden to promote biodiversity and reduce the need for harmful chemicals."
        ),
        Suggestion(
            title: "Reduce, Reuse, Recycle",
            detail: "Adopt the mantra of reducing waste: Reduce what you use, reuse Challenges when possible, and recycle materials like glass, plastic, and aluminum."
        ),
        Suggestion(
            title: "Conserve Energy at Home",
            detail: "Lower your thermostat in the winter and raise it in the summer to reduce heating and cooling costs. Seal gaps and cracks in your home's insulation to prevent energy loss."
        ),
        Suggestion(
            title: "Support Local and Sustainable Food",
            detail: "Buy locally sourced and sustainably produced food whenever possible. This reduces the carbon footprint associated with long-distance transportation and supports local farmers."
        ),
        Suggestion(
            title: "Practice Eco-Friendly Travel",
            detail: "When traveling, choose eco-friendly transportation options, such as biking, walking, or using public transit. Consider staying at green hotels and minimizing water and energy use."
        ),
        Suggestion(
            title: "Reduce Water Waste in the Kitchen",
            detail: "Use a dishwasher with a full load, fix leaking faucets, and use a broom instead of a hose to clean driveways and sidewalks to save water."
        ),
        Suggestion(
            title: "Reduce Phantom Power",
            detail: "Unplug electronic devices and chargers when not in use or use smart power strips to prevent standby power consumption."
        ),
        Suggestion(
            title: "Participate in Community Cleanups",
            detail: "Join or organize local community cleanups to remove litter and debris from parks, beaches, and natural areas to keep them clean and beautiful."
        ),
        Suggestion(
            title: "Reduce Water Waste in the Bathroom",
            detail: "Install low-flow showerheads and faucet aerators to reduce water use in the bathroom. Fix leaky toilets promptly to prevent water waste."
        ),
        Suggestion(
            title: "Practice Eco-Friendly Shopping",
            detail: "Support brands and products that prioritize sustainability and ethical practices. Choose products with minimal packaging and consider secondhand or thrift shopping."
        ),
        Suggestion(
            title: "Support Conservation Organizations",
            detail: "Donate to and volunteer with conservation organizations that work to protect and preserve the environment and wildlife."
        ),
        Suggestion(
            title: "Stay Informed and Advocate",
            detail: "Stay informed about environmental issues and advocate for policies and practices that promote sustainability and protect the planet."
        )

    ]
    
    
    //save Challenges
    @Published public var Challenges: [Challenge] =  [
        // Challenge 1: Reduce Plastic Waste
        Challenge(title: "Reduce Plastic Waste", difficulty: "Beginner",
                  description:
                  """
                  - Avoid single-use plastic straws and utensils.
                  - Use a reusable water bottle.
                  - Bring your own reusable bags.
                  """
        ),
        
        Challenge(title: "Reduce Plastic Waste", difficulty: "Intermediate",
                  description:
                  """
                  - Use a refillable water bottle; eliminate single-use plastic bottles.
                  - Choose products with minimal or no plastic packaging.
                  - Invest in reusable beeswax wraps or silicone food storage.
                  """
        ),
        
        Challenge(title: "Reduce Plastic Waste", difficulty: "Advanced",
                  description:
                  """
                  - Commit to a plastic-free month.
                  - Make your own cleaning products to avoid plastic containers.
                  - Find and support local stores that offer bulk food Challenges to reduce plastic packaging.
                  """
        ),
        
        // Challenge 2: Energy Efficiency
        Challenge(title: "Energy Efficiency", difficulty: "Beginner",
                  description:
                  """
                  - Turn off lights and electronics when not in use.
                  - Unplug chargers and devices when fully charged.
                  - Use natural light during the day.
                  """
        ),
        
        Challenge(title: "Energy Efficiency", difficulty: "Intermediate",
                  description:
                  """
                  - Upgrade to energy-efficient appliances.
                  - Seal drafts in your home to improve insulation.
                  - Set your thermostat a few degrees lower in winter and higher in summer.
                  """
        ),
        
        Challenge(title: "Energy Efficiency", difficulty: "Advanced",
                  description:
                  """
                  - Install a programmable thermostat for optimized energy usage.
                  - Invest in solar panels for your home.
                  - Conduct a comprehensive energy audit to identify and address all sources of inefficiency.
                  """
        ),
        
        // Challenge 3: Sustainable Transportation
        Challenge(title: "Sustainable Transportation", difficulty: "Beginner",
                  description:
                  """
                  - Walk or bike for short-distance trips.
                  - Use public transportation or carpool.
                  - Plan and consolidate errands to reduce the number of car trips.
                  """
        ),
        
        Challenge(title: "Sustainable Transportation", difficulty: "Intermediate",
                  description:
                  """
                  - Explore electric scooter or bike-sharing options.
                  - Invest in a hybrid or electric vehicle.
                  - Opt for long-distance travel by train or bus instead of flying.
                  """
        ),
        
        Challenge(title: "Sustainable Transportation", difficulty: "Advanced",
                  description:
                  """
                  - Commit to a car-free week or month.
                  - Advocate for and support local initiatives to improve public transportation.
                  - Consider alternatives like car-sharing programs or electric car rentals.
                  """
        ),
        
        // Challenge 4: Meatless Meals
        Challenge(title: "Meatless Meals", difficulty: "Beginner",
                  description:
                  """
                  - Have a meatless day each week.
                  - Explore plant-based recipes.
                  - Support local farmers.
                  """
        ),
        
        Challenge(title: "Meatless Meals", difficulty: "Intermediate",
                  description:
                  """
                  - Choose seasonal produce; reduce food miles.
                  - Adopt a vegetarian diet for a week.
                  - Educate yourself on the environmental impact of meat production.
                  """
        ),
        
        Challenge(title: "Meatless Meals", difficulty: "Advanced",
                  description:
                  """
                  - Adopt a vegan diet for a month.
                  - Organize a plant-based potluck with friends.
                  - Advocate for more plant-based options in your community.
                  """
        ),
        
        // Challenge 5: Water Conservation
        Challenge(title: "Water Conservation", difficulty: "Beginner",
                  description:
                  """
                  - Fix leaks and use a broom instead of a hose for outdoor cleaning.
                  - Install low-flow faucets.
                  - Collect rainwater for plants.
                  """
        ),
        
        Challenge(title: "Water Conservation", difficulty: "Intermediate",
                  description:
                  """
                  - Use a pool cover to reduce evaporation.
                  - Educate yourself on the water footprint of various products.
                  - Participate in a community water conservation initiative.
                  """
        ),
        
        Challenge(title: "Water Conservation", difficulty: "Advanced",
                  description:
                  """
                  - Install a greywater system to reuse household water.
                  - Advocate for water-saving policies in your community.
                  - Teach others about the importance of water conservation.
                  """
        ),
        
        // Challenge 6: Minimalist Wardrobe
        Challenge(title: "Minimalist Wardrobe", difficulty: "Beginner",
                  description:
                  """
                  - Declutter and donate unused clothing Challenges.
                  - Choose quality over quantity when buying clothes.
                  - Experiment with creating different outfits from a minimal wardrobe.
                  """
        ),
        
        Challenge(title: "Minimalist Wardrobe", difficulty: "Intermediate",
                  description:
                  """
                  - Create a capsule wardrobe for a season.
                  - Buy second-hand or from sustainable fashion brands.
                  - Educate yourself on the environmental impact of the fashion industry.
                  """
        ),
        
        Challenge(title: "Minimalist Wardrobe", difficulty: "Advanced",
                  description:
                  """
                  - Commit to a year-long shopping ban.
                  - Learn to mend and repair your clothing.
                  - Inspire others to embrace a minimalist wardrobe.
                  """
        ),
        
        // Challenge 7: Local and Seasonal Eating
        Challenge(title: "Local & Seasonal Eating", difficulty: "Beginner",
                  description:
                  """
                  - Shop at local farmers' markets.
                  - Choose seasonal produce.
                  - Support local food producers.
                  """
        ),
        
        Challenge(title: "Local & Seasonal Eating", difficulty: "Intermediate",
                  description:
                  """
                  - Reduce food waste by meal planning.
                  - Join a community-supported agriculture (CSA) program.
                  - Preserve seasonal foods for later use.
                  """
        ),
        
        Challenge(title: "Local & Seasonal Eating", difficulty: "Advanced",
                  description:
                  """
                  - Grow your own vegetables.
                  - Host a local food potluck or cooking class.
                  - Advocate for policies that support local and sustainable food systems.
                  """
        ),
        
        // Challenge 8: Digital Detox
        Challenge(title: "Digital Detox", difficulty: "Beginner",
                  description:
                  """
                  - Set designated screen-free times.
                  - Take short breaks from screens throughout the day.
                  - Turn off notifications to reduce digital interruptions.
                  """
        ),
        
        Challenge(title: "Digital Detox", difficulty: "Intermediate",
                  description:
                  """
                  - Reduce screen time by an hour each day.
                  - Establish a tech-free zone in your home.
                  - Plan a weekend digital detox with friends or family.
                  """
        ),
        
        Challenge(title: "Digital Detox", difficulty: "Advanced",
                  description:
                  """
                  - Go on a week-long digital detox.
                  - Create a daily routine that includes dedicated screen-free time.
                  - Inspire others to take digital detox challenges.
                  """
        ),
        
        // Challenge 9: Community Cleanup
        Challenge(title: "Community Cleanup", difficulty: "Beginner",
                  description:
                  """
                  - Participate in a local cleanup event.
                  - Encourage friends and family to join.
                  - Share your cleanup experience on social media.
                  """
        ),
        
        Challenge(title: "Community Cleanup", difficulty: "Intermediate",
                  description:
                  """
                  - Organize a neighborhood cleanup initiative.
                  - Collaborate with local businesses for support.
                  - Create a community awareness campaign on waste reduction.
                  """
        ),
        
        Challenge(title: "Community Cleanup", difficulty: "Advanced",
                  description:
                  """
                  - Adopt a local park or beach for regular cleanups.
                  - Establish a community waste reduction and recycling program.
                  - Engage local schools and organizations in environmental education.
                  """
        ),
        
        // Challenge 10: Eco-Friendly Education
        Challenge(title: "Eco-Friendly Education", difficulty: "Beginner",
                  description:
                  """
                  - Share eco-friendly tips on social media.
                  - Participate in online discussions about sustainability.
                  - Start a blog or vlog to document your eco-friendly journey.
                  """
        ),
        
        Challenge(title: "Eco-Friendly Education", difficulty: "Intermediate",
                  description:
                  """
                  - Organize a workshop on sustainable living.
                  - Collaborate with local environmental groups for outreach.
                  - Develop educational materials to share with your community.
                  """
        ),
        
        Challenge(title: "Eco-Friendly Education", difficulty: "Advanced",
                  description:
                  """
                  - Collaborate with local schools or organizations for ongoing environmental education.
                  - Host webinars or speak at conferences about sustainable practices.
                  - Develop and implement an eco-friendly curriculum for schools.
                  """
        ),
    ]{
        didSet {
            saveChallenges()
        }
    }
        
    init() {
        loadChallenges()
    }
    
    func getChalllengesArchiveURL() -> URL {
        let plistName = "Challenges.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func saveChallenges() {
        let archiveURL = getChalllengesArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedChallenges = try? propertyListEncoder.encode(Challenges)
        try? encodedChallenges?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func loadChallenges() {
        let archiveURL = getChalllengesArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedChallengeData = try? Data(contentsOf: archiveURL),
            let ChallengesDecoded = try? propertyListDecoder.decode([Challenge].self, from: retrievedChallengeData) {
            Challenges = ChallengesDecoded
        }
    }
}
