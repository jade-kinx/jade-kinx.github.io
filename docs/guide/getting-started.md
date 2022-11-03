# Welcome to MkDocs

For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

## Examples

```json linenums="1"
{
    "context_is_admin":  "role:admin",
    "default": "role:admin",

    "add_image": "",
    "delete_image": "",
    "publicize_image": "role:admin",

	# ...
}
```


=== "C"

    ```c title="C언어"
    #include <stdio.h>

    int main(void) {
        print("Hello World!\n");
        return 0;
    }
    ```

=== "C++"

    ```cpp title="C++언어"
    #include <iostream.h>

    int main(void) {
        std::cout << "Hello World!" << std::endl;
        return 0;
    }
    ```
