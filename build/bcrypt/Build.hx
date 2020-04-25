import haxe.Timer;
import haxe.macro.Compiler;

/**
	helper class to build everything, avoids `--next`
**/
class Build {
	/**
		run all build files
	**/
	public static function main() {
		callLix("build/bcrypt/buildCpp.hxml", "C++");
		callLix("build/bcrypt/buildCppGCGen.hxml", "C++ (HXCPP_GC_GENERATIONAL)");
		callLix("build/bcrypt/buildCppia.hxml", "Cppia");
		callLix("build/bcrypt/buildCs.hxml", "C#");
		callLix("build/bcrypt/buildJava.hxml", "Java");
		callLix("build/bcrypt/buildJvm.hxml", "JVM");
		callLix("build/bcrypt/buildHl.hxml", "HL/Jit");
		callLix("build/bcrypt/buildHlc.hxml", "HL/C");
		callLix("build/bcrypt/buildJs.hxml", "JS/ES5");
		callLix("build/bcrypt/buildJsES6.hxml", "JS/ES6");
		callLix("build/bcrypt/buildNeko.hxml", "Neko");
		callLix("build/bcrypt/buildPhp.hxml", "PHP7");
		callLix("build/bcrypt/buildPython.hxml", "Python");
		callLix("build/bcrypt/buildLua.hxml", "Lua");
	}

	/**
		perform lix call and take build times

		@param buildFile HXML build file
		@param title description to use when printing build time
	**/
	public static function callLix(buildFile:String, title:String) {
		var startTime = Timer.stamp();
		var exitCode:Int = Sys.command("npx", ["haxe", "build/bcrypt/common.hxml", buildFile]);
		var exitText:String = "";
		if (exitCode != 0) {
			exitText = ' - exitCode: $exitCode';
		}

		Sys.println('[${Compiler.getDefine("haxe_ver")}] built $title (${Timer.stamp() - startTime})$exitText');
	}
}
