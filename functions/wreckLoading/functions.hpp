class FBM_wreckLoading {
    tag = "FBM";
    class wreckLoading {
        file = "functions\wreckLoading";
        class initWreckLoading { postInit = 1;};
    };
    class actions {
        file = "functions\wreckLoading\actions";
        class createWreckCarrierActions {};  
        class addWreckCarrierActions {};
        class getUnloadCarrier {};
        class addNearbyWreckActions {};
        class startUnloadWreck {};
    };
    class config {
        file = "functions\wreckLoading\config";
        class getCarrierAttachOffset {};
        class getCarrierDirOffset {};
        class getCarrierDetachOffset {};
        class getWreckCategory {};
        class isValidWreckCarrier {};
        class findNearbyWrecks {};
    };
    class load {
        file = "functions\wreckLoading\load";
        class unloadWreck {};
        class loadWreck {};        
    };
    class util {
        file = "functions\wreckLoading\util";
        class getWreckCarrierConfig {};
    };
};
