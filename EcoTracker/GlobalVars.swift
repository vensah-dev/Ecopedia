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
    var tip: String
    var detail: String = "test"
    
}

public var interactableColor = Color(red: 60/255, green: 193/255, blue: 98/255)

var Suggestions: [Suggestion] = [
    Suggestion(
        tip: "Reduce Energy Usage",
        detail: "Turn off lights and appliances when not in use to save energy and reduce your carbon footprint. Unplug chargers and electronic devices that are not in use, as they can still draw power even when turned off."
    ),
    Suggestion(
        tip: "Carpool or Use Public Transport",
        detail: "Opt for carpooling or public transportation to reduce emissions and air pollution. Carpooling with others or using buses, trains, or subways can help reduce the number of vehicles on the road, which lowers traffic congestion and greenhouse gas emissions."
    ),
    Suggestion(
        tip: "Recycle Paper and Cardboard",
        detail: "Recycle paper and cardboard products to save trees and reduce waste. Separate paper and cardboard from your regular trash and place them in recycling bins. Recycling paper reduces the need to cut down more trees for paper production and minimizes landfill waste."
    ),
    Suggestion(
        tip: "Use Reusable Bags",
        detail: "Bring your own reusable bags when shopping to reduce the use of single-use plastic bags. Many stores offer reusable bags for purchase, and some even provide discounts to customers who bring their own bags. Using reusable bags reduces plastic waste and pollution."
    ),
    Suggestion(
        tip: "Conserve Water",
        detail: "Fix leaks, take shorter showers, and use water-saving appliances to conserve water resources. Repairing leaky faucets and pipes prevents water wastage. Reducing shower time and installing low-flow toilets and showerheads can significantly decrease water consumption."
    ),
    Suggestion(
        tip: "Reduce Meat Consumption",
        detail: "Eating less meat or opting for plant-based meals can lower your carbon footprint. Livestock farming generates significant greenhouse gas emissions. Consider incorporating more plant-based foods into your diet to reduce the environmental impact of meat production."
    ),
    Suggestion(
        tip: "Compost Organic Waste",
        detail: "Composting food scraps and yard waste reduces landfill waste and enriches soil. Create a compost pile or use a composting bin to turn organic waste into nutrient-rich compost. Compost can be used to improve soil quality in gardens and reduce the need for chemical fertilizers."
    ),
    Suggestion(
        tip: "Choose Energy-Efficient Appliances",
        detail: "Upgrade to energy-efficient appliances to save on electricity and reduce emissions. Look for appliances with the ENERGY STAR label, which indicates that they meet energy efficiency standards. Energy-efficient appliances consume less electricity, resulting in lower energy bills and reduced environmental impact."
    ),
    Suggestion(
        tip: "Support Renewable Energy",
        detail: "Switch to a renewable energy provider or install solar panels to reduce reliance on fossil fuels. Renewable energy sources like wind, solar, and hydroelectric power generate electricity with minimal greenhouse gas emissions. Transitioning to renewable energy helps combat climate change."
    ),
    Suggestion(
        tip: "Plant Trees",
        detail: "Planting trees helps offset carbon emissions and supports biodiversity. Trees absorb carbon dioxide from the atmosphere and release oxygen. They also provide habitat for wildlife. Participate in tree-planting programs or plant trees in your own backyard to contribute to reforestation efforts."
    ),
    Suggestion(
        tip: "Reduce Plastic Use",
        detail: "Minimize plastic waste by using reusable water bottles, avoiding single-use plastic cutlery and straws, and choosing products with minimal plastic packaging."
    ),
    Suggestion(
        tip: "Use Energy-Efficient Lighting",
        detail: "Replace incandescent bulbs with energy-efficient LED or CFL bulbs. They use less energy and last longer, reducing the need for frequent replacements."
    ),
    Suggestion(
        tip: "Practice Sustainable Gardening",
        detail: "Use native plants, mulch, and natural pest control methods in your garden to promote biodiversity and reduce the need for harmful chemicals."
    ),
    Suggestion(
        tip: "Reduce, Reuse, Recycle",
        detail: "Adopt the mantra of reducing waste: Reduce what you use, reuse items when possible, and recycle materials like glass, plastic, and aluminum."
    ),
    Suggestion(
        tip: "Conserve Energy at Home",
        detail: "Lower your thermostat in the winter and raise it in the summer to reduce heating and cooling costs. Seal gaps and cracks in your home's insulation to prevent energy loss."
    ),
    Suggestion(
        tip: "Support Local and Sustainable Food",
        detail: "Buy locally sourced and sustainably produced food whenever possible. This reduces the carbon footprint associated with long-distance transportation and supports local farmers."
    ),
    Suggestion(
        tip: "Practice Eco-Friendly Travel",
        detail: "When traveling, choose eco-friendly transportation options, such as biking, walking, or using public transit. Consider staying at green hotels and minimizing water and energy use."
    ),
    Suggestion(
        tip: "Reduce Water Waste in the Kitchen",
        detail: "Use a dishwasher with a full load, fix leaking faucets, and use a broom instead of a hose to clean driveways and sidewalks to save water."
    ),
    Suggestion(
        tip: "Reduce Phantom Power",
        detail: "Unplug electronic devices and chargers when not in use or use smart power strips to prevent standby power consumption."
    ),
    Suggestion(
        tip: "Participate in Community Cleanups",
        detail: "Join or organize local community cleanups to remove litter and debris from parks, beaches, and natural areas to keep them clean and beautiful."
    ),
    Suggestion(
        tip: "Reduce Water Waste in the Bathroom",
        detail: "Install low-flow showerheads and faucet aerators to reduce water use in the bathroom. Fix leaky toilets promptly to prevent water waste."
    ),
    Suggestion(
        tip: "Practice Eco-Friendly Shopping",
        detail: "Support brands and products that prioritize sustainability and ethical practices. Choose products with minimal packaging and consider secondhand or thrift shopping."
    ),
    Suggestion(
        tip: "Support Conservation Organizations",
        detail: "Donate to and volunteer with conservation organizations that work to protect and preserve the environment and wildlife."
    ),
    Suggestion(
        tip: "Stay Informed and Advocate",
        detail: "Stay informed about environmental issues and advocate for policies and practices that promote sustainability and protect the planet."
    )

]

