**How to authenticate in new Linux installation**:

`gh auth login`

All my executables are saved in bin.

1. `touch ~/bin/<script>` (without extension)
2. `code ~/bin/<script>`
3. On first line, add shebang
	#!/bin/bash            – Execute the file using the Bash shell
	#!/usr/bin/pwsh	       – Execute the file using PowerShell
	#!/usr/bin/env python3 – Execute with a Python interpreter
  #!/usr/bin/perl        - Execute with Perl
	#!/bin/false 	       – Do nothing, but return a non-zero exit status, indicating failure. Used to prevent stand-alone execution of a script file intended for execution in a specific context
5. Run `activate <script>` to make it executable (chmod +x ~/bin/<script>).

Done. The script is now ready to be executed.
