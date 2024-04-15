pragma solidity ^0.8.24;

import "./EuroToken.sol";
import "./BondToken.sol";
import { BokkyPooBahsDateTimeLibrary } from "BokkyPooBahsDateTimeLibrary/contracts/BokkyPooBahsDateTimeLibrary.sol";
import "prb-math/UD60x18.sol";

contract CampaignManager {
    enum Periodicity {
        Annual,
        Quarterly,
        Monthly
    }

    struct CampaignParams {
        uint256 coupure;
        uint256 campaignMinAmount;
        uint256 campaignMaxAmount;
        bool paused;
    }
    //...

    mapping(uint256 => CampaignParams) public campaigns;

    function initializeBond(uint256 id, CampaignParams memory cp) public {
        campaigns[id].coupure = cp.coupure;
        //...
    }

    function setCouponTable(uint256 id, uint256 issueTimeStamp) public {

        uint256 year;
        uint256 month;
        uint256 day;
        (year, month, day) = BokkyPooBahsDateTimeLibrary.timestampToDate(issueTimeStamp);

    }

    function pauseCampaign(uint256 id) public {
        campaigns[id].paused = true;
    }

}
