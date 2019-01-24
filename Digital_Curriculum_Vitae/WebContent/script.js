function  checkPass()
	{
	    var password=document.getElementById("pass").value;
	    if(password.length<8)
	    {
	        document.getElementById("validPass").innerHTML="Password must be 8 Character";
	        document.getElementById("sub").disabled = true;
	        document.getElementById("reTypePass").disabled = true;
	    }
	    else {
	        document.getElementById("validPass").innerHTML="Valid Password";
	        document.getElementById("sub").disabled = false;
	        document.getElementById("reTypePass").disabled = false;
	    }
	}

function  checkRPass()
{
    var password=document.getElementById("pass").value;
    var Rpassword=document.getElementById("reTypePass").value;
    if(password!=Rpassword)
    {
        document.getElementById("validRpass").innerHTML="Password Miss Match";
        document.getElementById("sub").disabled = true;
    }
    else {
        document.getElementById("validRpass").innerHTML="Valid Password";
        document.getElementById("sub").disabled = false;
    }
}