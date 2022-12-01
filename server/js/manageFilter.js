var manageFilter = {
  init : function(){
    var da = this;
    var vAction             = da.action.attribute01;
    var vType               = da.action.attribute02;  
    var vColumnType         = da.action.attribute03;  
    var vColumnName         = da.action.attribute04;  
    var vOperator           = da.action.attribute05;  
    var vValue              = apex.item( da.action.attribute06 ).getValue();  
    var vSave               = ( da.action.attribute07 == "Y" );  
    var vCaseSensitive      = ( da.action.attribute08 == "Y" );  
    var vRefreshData        = ( da.action.attribute09 == "Y" );  
    var vSkipNoChangesCheck = ( da.action.attribute10 == "Y" );  
    var vInSeparator        = da.action.attribute11;  

    var vRegion = apex.region( da.affectedElements[0].id );
    
    // If operator is IN or NOT IN, replace with provided value
    if ((vInSeparator) && (vOperator == "IN" || vOperator == "NIN")) {
      vValue = vValue.replace(/:/g, String.fromCharCode(01));
    }
    
    // Remove current filters
    var vFilters = vRegion.call( "getFilters" );
    var vFilterColId = vRegion.call("getViews").grid.modelColumns[  vColumnName  ].id;
    for ( var i in vFilters ){
     if ( vFilters[i].columnId == vFilterColId ){
       vRegion.call( "deleteFilter", vFilters[i].id );
     }  
    }

    if ( vAction == "addFilter"){
        vRegion.call( vAction
          , { type               : vType
            , columnType         : vColumnType
            , columnName         : vColumnName
            , operator           : vOperator
            , value              : vValue
            , save               : vSave
            , isCaseSensitive    : vCaseSensitive
            , refreshData        : vRefreshData
            , skipNoChangesCheck : vSkipNoChangesCheck 
          });
    }      
  }    
}