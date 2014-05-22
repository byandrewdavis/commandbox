/**
*********************************************************************************
* Copyright Since 2005 ColdBox Platform by Ortus Solutions, Corp
* www.coldbox.org | www.ortussolutions.com
********************************************************************************
* @author Brad Wood, Luis Majano, Denny Valliant
*
* I am a helper object that wraps the print helper.  Instead of returning
* text, I accumulate it in a variable that can be retreived at the end.
*
*/
component extends="Print" {

	property name="shell" inject="shell";
	
	variables.result = '';
		
	function init() {
		return this;
	}
	
	// Force a flush
	function toConsole(  ) {
		variables.shell.printString( getResult() );
		clear();
	}
	
	// Reset the result
	function clear() {
		variables.result = '';		
	}
	
	// Retrieve the current text that has been accumulated
	function getResult() {
		return variables.result;
	}
		
	// Proxy through any methods to the actual print helper
	function onMissingMethod( missingMethodName, missingMethodArguments ) {
		variables.result &= super.onMissingMethod( missingMethodName, missingMethodArguments );
		return this;
	}
	
}