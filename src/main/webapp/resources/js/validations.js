/**
 * Common Javascript functions
 */
function displayFrame(id)
{
 	$("#displayContent").html($("#"+id).html());
 	$(".link").removeClass("active");
 	$("."+id).addClass("active"); 
}

function validateForm()
{ 
        var anyBoxesChecked = false;
        var anyRadioButtonsChecked = false;
        $('.skill:checkbox').each(function() {
            if ($(this).is(":checked")) {
                anyBoxesChecked= true;
                //Check for the skill level
                if ($('input[class='+$(this).val()+']:checked').length === 0) 
                	{
                	anyRadioButtonsChecked = false;
                	}
                else
                	anyRadioButtonsChecked = true;                	
            }
        });
     
        if (anyBoxesChecked == false) {
          alert('Please select at least one skill');
          return false;
        } 
        
        if (anyRadioButtonsChecked == false) {
            alert('Please select at least one level');
            return false;
          } 
       
        anyBoxesChecked = false;
        anyRadioButtonsChecked = false;
        $('.acdegree:checkbox').each(function() {
            if ($(this).is(":checked")) {
            	anyBoxesChecked= true;
                //Check for the selected field
                if ($('input[class='+$(this).val()+']:checked').length === 0) 
                	{
                	anyRadioButtonsChecked = false;
                	}
                else
                	anyRadioButtonsChecked = true;
            }
        });
     
        if (anyBoxesChecked == false) {
            alert('Please select at least one degree');
            return false;
          } 
          
          if (anyRadioButtonsChecked == false) {
              alert('Please select at least one area or field');
              return false;
            } 
}