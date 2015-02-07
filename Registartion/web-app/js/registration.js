/**
 * saves/updates the registration
 */
function persistRegistration(){
    if($("#userRegistrationForm").validate().form()){
        $("#userRegistrationForm").submit();
    }
}