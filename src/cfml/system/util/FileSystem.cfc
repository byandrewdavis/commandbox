/**
*********************************************************************************
* Copyright Since 2005 ColdBox Platform by Ortus Solutions, Corp
* www.coldbox.org | www.ortussolutions.com
********************************************************************************
* @author Brad Wood, Luis Majano, Denny Valliant
*
* I contain helpful methods for dealing with file and directory paths
*
*/
component singleton {
	
	property name="shell" inject="shell";

	function init() {
		return this;
	}

	function resolveDirectory( required directory ) {
			// Load our path into a Java file object so we can use some of its nice utility methods
			var oDirectory = createObject( 'java', 'java.io.File' ).init( javaCast( 'string', directory ) );

		// This tells us if it's a relative path
		// Note, at this point we don't actually know if it actually even exists yet
		if( !oDirectory.isAbsolute() ) {
			// If it's relative, we assume it's relative to the current working directory and make it absolute
			oDirectory = createObject( 'java', 'java.io.File' ).init( javaCast( 'string', shell.pwd() & '/' & directory ) );
		}

		// This will standardize the name and calculate stuff like ../../
		return oDirectory.getCanonicalPath();
	}

	// TODO: Add resolve file

}