# Usage
---

## Admonitions[^1]

### Basic Usage

Starts with `!!!`, contents starts with `4 spaces`

``` markdown title="Admonition"
!!! note

    Lorem, ipsum dolor sit amet consectetur adipisicing elit. 
    Qui temporibus veritatis recusandae exercitationem reprehenderit velit quam sequi 
    distinctio dolorum ducimus eius neque modi dolorem quod, maxime ipsam aperiam iure porro. 
    Fugit reprehenderit corporis, qui deleniti unde neque magnam beatae sit!
```

<div class="result" markdown>
!!! note

    Lorem, ipsum dolor sit amet consectetur adipisicing elit. 
    Qui temporibus veritatis recusandae exercitationem reprehenderit velit quam sequi 
    distinctio dolorum ducimus eius neque modi dolorem quod, maxime ipsam aperiam iure porro. 
    Fugit reprehenderit corporis, qui deleniti unde neque magnam beatae sit!

</div>


### Title

=== "With Title"
    ``` markdown title="Admonition with title"
    !!! note "This is Title"

        Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
        Libero cum fugit quas maiores exercitationem distinctio rem sit id optio nulla!

    ```

    <div class="result" markdown>
    !!! note "This is Title"

        Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
        Libero cum fugit quas maiores exercitationem distinctio rem sit id optio nulla!

    </div>

=== "Without Title"

    ``` markdown title="Admonition without title"
    !!! note ""

        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Exercitationem id 
        provident obcaecati maiores deserunt molestiae iste officiis incidunt adipisci 
        necessitatibus repellat eos, enim eligendi quis perferendis, placeat 
        reprehenderit blanditiis debitis.

    ```

    <div class="result" markdown>
    !!! note ""

        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Exercitationem id 
        provident obcaecati maiores deserunt molestiae iste officiis incidunt adipisci 
        necessitatibus repellat eos, enim eligendi quis perferendis, placeat 
        reprehenderit blanditiis debitis.

    </div>


### Collapsible Blocks

Starts with `???`, contents starts with `4 spaces`, initially expanded with `???+`

=== "Admonition, Collapsible"
    ``` markdown title="Admonition, Collapsible"
    ??? note

        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore quod commodi, quo et, 
        optio, ipsa fugit corrupti asperiores rerum perspiciatis dolor expedita ducimus voluptatibus 
        laudantium doloremque perferendis fugiat officiis ullam accusantium! Corrupti numquam earum 
        accusantium pariatur deleniti sint. Voluptatum, alias?
    ```

    <div class="result" markdown>
    ??? note

        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore quod commodi, quo et, 
        optio, ipsa fugit corrupti asperiores rerum perspiciatis dolor expedita ducimus voluptatibus 
        laudantium doloremque perferendis fugiat officiis ullam accusantium! Corrupti numquam earum 
        accusantium pariatur deleniti sint. Voluptatum, alias?

    </div>

=== "Admonition, Collapsible, Initially Expanded"
    ``` markdown title="Admonition, Collapsible, Expanded"
    ???+ note

        Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti voluptatibus officia magnam, 
        neque placeat id ad nam voluptas quidem tenetur aspernatur incidunt enim fuga debitis veniam 
        quia voluptatum alias dignissimos sapiente dolorum maiores amet ullam excepturi necessitatibus? 
        Voluptatem, esse harum.

    ```

    <div class="result" markdown>
    ???+ note

        Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti voluptatibus officia magnam, 
        neque placeat id ad nam voluptas quidem tenetur aspernatur incidunt enim fuga debitis veniam 
        quia voluptatum alias dignissimos sapiente dolorum maiores amet ullam excepturi necessitatibus? 
        Voluptatem, esse harum.
    </div>


### Supported Types

`note`, `abstract`, `info`, `tip`, `success`, `question`, `warning`, `failure`, `danger`, `bug`, `example`, `quote`

=== "note"
    <div class="result" markdown>
    !!! note
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "abstract"
    <div class="result" markdown>
    !!! abstract
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "info"
    <div class="result" markdown>
    !!! info
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "tip"
    <div class="result" markdown>
    !!! tip
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "success"
    <div class="success" markdown>
    !!! info
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "question"
    <div class="result" markdown>
    !!! question
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "warning"
    <div class="result" markdown>
    !!! warning
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "failure"
    <div class="result" markdown>
    !!! failure
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "danger"
    <div class="result" markdown>
    !!! danger
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "bug"
    <div class="result" markdown>
    !!! bug
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "example"
    <div class="result" markdown>
    !!! example
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>

=== "quote"
    <div class="result" markdown>
    !!! quote
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ea quas ad fugiat dolorum quos provident maiores, unde incidunt quae.
    </div>


## Code Blocks

### Basic Usage

Starts with `` ``` `` or `~~~`

```` markdown title="Code Block"
``` py
import tensorflow as tf
```
````
<div class="result" markdown>
``` py
import tensorflow as tf
```
</div>

### Title

```` markdown title="Code Block with Title"
``` py title="bubble_sort.py"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```
````
<div class="result" markdown>
``` py title="bubble_sort.py"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```
</div>

### Line Numbers / Highlighting

Add `linenums="1"` for line numbers  
Add `hl_lines="{number} {number}"` for highlighting

```` markdown title=""
``` py title="bubble_sort.py" linenums="1" hl_lines="2 4"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```
````
<div class="result" markdown>
``` py title="bubble_sort.py" linenums="1" hl_lines="2 4"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```
</div>


### Inline Highlighting

Add `#!{lang}` for syntax highlighting

``` markdown title="Inline Highlighting"
The `#!python range()` function is used to generate a sequence of numbers.
```

<div class="result" markdown>
The `#!python range()` function is used to generate a sequence of numbers.
</div>


## Contents Tabs

Starts with `=== "title"`, contents starts with `4 spaces`

### Grouping code blocks

```` title="Contents tabs with code blocks"
=== "C"

    ``` c title=""
    #include <stdio.h>
    
    int main(void) {
        printf("Hello World!\n");
        return 0;
    }
    ```

=== "C++"

    ``` c++ title=""
    #include <iostream>
    
    int main(void) {
        std::cout << "Hello World!" << std::endl;
        return 0;
    }
    ```

````

<div class="result" markdown>
=== "C"

    ~~~ c title=""
    #include <stdio.h>
    
    int main(void) {
        printf("Hello World!\n");
        return 0;
    }
    ~~~

=== "C++"

    ~~~ c++ title=""
    #include <iostream>
    
    int main(void) {
        std::cout << "Hello World!" << std::endl;
        return 0;
    }
    ~~~
</div>

### Grouping other contents

```` title="content tabs"
=== "Ordered List"

    1. Lorem ipsum dolor sit.
    1. Lorem ipsum dolor sit.
    1. Lorem ipsum dolor sit.

=== "Unordered List"

    * Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.

=== "Markdown Block"

    ``` markdown
    * Lorem ipsum dolor sit.
        1. Lorem ipsum dolor sit.
        1. Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.
    ```

=== "Admonition"

    !!! note
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, accusamus repudiandae quod 
        quasi nemo animi dolores corporis impedit iusto pariatur.

````

<div class="result" markdown>
=== "Ordered List"

    1. Lorem ipsum dolor sit.
    1. Lorem ipsum dolor sit.
    1. Lorem ipsum dolor sit.

=== "Unordered List"

    * Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.

=== "Markdown Block"

    ``` markdown
    * Lorem ipsum dolor sit.
        1. Lorem ipsum dolor sit.
        1. Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.
    * Lorem ipsum dolor sit.
    ```

=== "Admonition"

    !!! note
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, accusamus repudiandae quod 
        quasi nemo animi dolores corporis impedit iusto pariatur.

</div>


## Footnotes

### Adding footnote references

```` title="Text with footnote references"
Lorem ipsum[^2] dolor sit amet consectetur adipisicing elit. Saepe[^3], ipsa?
````

<div class="result" markdown>
Lorem ipsum[^2] dolor sit amet consectetur adipisicing elit. Saepe[^3], ipsa?
</div>

### Adding footnote contents

```` title="Footnotes"
[^1]:
    Admonitions, also known as call-outs, are an excellent choice for including side content without 
    significantly interrupting the document flow. Material for MkDocs provides several different types 
    of admonitions and allows for the inclusion and nesting of arbitrary content. 
[^2]: Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusantium, similique.
[^3]:
    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Vero blanditiis distinctio consequuntur 
    laborum dolores libero earum odit ea voluptatum numquam sed quisquam voluptate minus maiores aut 
    ducimus voluptatem, inventore facere!
````

<!-- 
Footnotes 
//-->
[^1]:
    Admonitions, also known as call-outs, are an excellent choice for including side content without significantly interrupting the document flow. Material for MkDocs provides several different types of admonitions and allows for the inclusion and nesting of arbitrary content. 
[^2]: Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusantium, similique.
[^3]:
    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Vero blanditiis distinctio consequuntur 
    laborum dolores libero earum odit ea voluptatum numquam sed quisquam voluptate minus maiores aut 
    ducimus voluptatem, inventore facere!
