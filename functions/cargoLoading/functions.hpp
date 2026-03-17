class FBM_CargoLoading
{
    tag = "FBM";
    class cargoLoading {
        file = "functions\cargoLoading";
        class initCargoLoading { postInit = 1;};
    };
    class actions {
        file = "functions\cargoLoading\actions";
        class addNearbyCargoActions {};
        class createCargoActions {};
        class addLoadedCargoActions {};

    };
    class config {
        file = "functions\cargoLoading\config";
        class isValidCargoCarrier {};
        class isValidCargoObject {};
        class canLoadCargoObject {};
    };
    class logic {
        file = "functions\cargoLoading\logic";
        class findNearbyCargoObjects {};
        class loadCargoObject {};
        class unloadCargoObject {};
        class getLoadedCargoObjects {};
        class findLoadedCargoObjects {};
    };
};
