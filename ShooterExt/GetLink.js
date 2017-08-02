var GetLink = function() {};

GetLink.prototype = {
    
    run: function(arguments) {
        
        arguments.completionFunction({"URL": document.URL});
        
    }
};

var ExtensionPreprocessingJS = new GetLink;
