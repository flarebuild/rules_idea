package rules_intellij.worker

import com.beust.jcommander.JCommander
import com.beust.jcommander.Parameter

class IndexingWorkerArgs {
    @Parameter(names = ["--persistent_worker"])
    var isPersistent = false

    @Parameter(names = ["--debug_log"])
    var debugLog: String? = null

    @Parameter(names = ["--debug_endpoint"])
    var debugEndpoint: String? = null

    @Parameter(names = ["--debug_domain_socket"])
    var debugDomainSocket: String? = null

    @Parameter(names = ["--project_dir"])
    var projectDir: String? = null

    @Parameter(names = ["--java_binary"])
    var javaBinary: String? = null

    @Parameter(names = ["--ide_home_dir"])
    var ideHomeDir: String? = null

    @Parameter(names = ["--ide_binary"])
    var ideBinary: String? = null

    @Parameter(names = ["--plugins_directory"])
    var pluginsDirectory: String? = null

    fun parseArgs(args: Array<String>) {
        try {
            JCommander
                .newBuilder()
                .addObject(this)
                .build()
                .parse(*args)
        } catch (e: Exception) {
            throw RuntimeException("IndexingWorkerArgs parse exception: $e\nArgs: ${args.joinToString(" ")}")
        }
    }

}

class IndexingRequestArgs {
    @Parameter(names = ["--name"])
    var name: String? = null

    @Parameter(names = ["--target"])
    var target: String? = null

    @Parameter(names = ["--out_dir"])
    var outDir: String? = null

    @Parameter(names = ["-s"])
    var sources: List<String> = ArrayList()

    fun parseArgs(args: Array<String>) {
        try {
            JCommander
                .newBuilder()
                .addObject(this)
                .build()
                .parse(*args)
        } catch (e: Exception) {
            throw RuntimeException("IndexingRequestArgs parse exception: $e\nArgs: ${args.joinToString(" ")}")
        }
    }
}