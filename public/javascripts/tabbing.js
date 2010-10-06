var curr,prev;function message(a){if(!a){curr=1;prev=1;}else{prev=(!prev)?prev=1:prev=curr;curr=a;}}
jQuery(function(){
	jQuery("#tab li a#t".curr).click(function(){
		if(prev!=curr){
			jQuery("#c"+curr).show();
			jQuery("#t"+curr).css({backgroundColor:"#282828", color:"#fff"});
			jQuery("#c"+prev).hide();
			jQuery("#t"+prev).css({backgroundColor:"#767676", color:"#fff"});
		}
	});

});
 