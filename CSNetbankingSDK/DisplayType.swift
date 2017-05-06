//
//  DisplayType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class DisplayType: WebApiEntity
{
    /**
     * Title of the promotion.
     */
    public internal (set) var titleText:                            String?
    
    /**
     * Additional - subline text for the title.
     */
    public internal (set) var sublineText:                          String?
    
    /**
     * The type of the layout for the campaign. Currently only these values are possible: OVERVIEW_CARD
     */
    public internal (set) var displayType:                          DisplayTypeKind!
    
    /**
     * Type of the campaign, possible values are PRODUCT_PROMOTION, PLUGIN_PROMOTION, INFOCARD, SHADOWCARD
     */
    public internal (set) var cardDesign:                           CardDesign!
    
    /**
     * relative path of url for the background picture published in WCM.
     */
    public internal (set) var backgroundImage:                      String?
    
    /**
     * relative path of url for the main picture published in WCM.
     */
    public internal (set) var mainImage:                            String?
    
    /**
     * Number of the row in the Overview screen, where the promotion should by displayed. Relevant only for displayType OVERVIEW_CARD
     */
    public internal (set) var position:                             Int!
    
    /**
     * Number of the column in the Overview screen, where the promotion should by displayed. Relevant only for displayType OVERVIEW_CARD
     */
    public internal (set) var column:                               Int!
    
    /**
     * Labeling of the main button. Can also be empty, if empty we don’t show a button. Max characters: 30 preliminary value can perhaps change later.
     */
    public internal (set) var btnText:                              String?
    
    /**
     * Key, describing the look of the main button. Must be one of the 
     * following values: DEFAULT BORDER PRIMARY SUCCESS INFO WARNING DANGER LINK, GREY
     */
    public internal (set) var btnDesign:                            ButtonDesign?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.displayType = .other(value: "")
        self.cardDesign  = .other(value: "")
        self.position    = Int()
        self.column      = Int()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.titleText                <- map["titleText"]
        self.sublineText              <- map["sublineText"]
        self.displayType              <- (map["displayType"], DisplayTypeKind.transform())
        self.cardDesign               <- (map["cardDesign"], CardDesign.transform())
        self.backgroundImage          <- map["backgroundImage"]
        self.mainImage                <- map["mainImage"]
        self.position                 <- map["position"]
        self.column                   <- map["column"]
        self.btnText                  <- map["btnText"]
        self.btnDesign                <- (map["btnDesign"], ButtonDesign.transform())
        
        super.mapping( map )
    }
}
