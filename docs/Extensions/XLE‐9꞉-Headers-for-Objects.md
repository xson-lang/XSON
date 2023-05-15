**Purpose:** TOML Compatibility, INI Compatibility

**Description:** 
Objects can be represented with headers enclosed by square brackets,
instead of the typical curly brace notation.
With headers, objects are treated more like tables. 

All key-value pairs under an object/table header are considered part of that object, 
until the next header or the end of the file.

The curly braces and key-value separator (colon by default)
are also omitted when using this notation.

Sub-objects are denoted using a period character (`.`) for each object level.

It is recommended to only use this extension for compatibility reasons,
as using square brackets for objects and arrays degrades readability

**Created On**: May 17th, 2023

**Status:** Active

**Examples:** 

<table><tr>

<th>Original</th><th>Headers</th>

</tr><tr><td>

```yaml
servers: {
  alpha:  [10.0.0.2, My Home Server]
  bravo:  [10.0.0.7, My Work Server]
  charlie:[10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  }
}
```  

</td><td>

```toml 
[servers]
alpha:   [10.0.0.2, My Home Server]
bravo:   [10.0.0.7, My Work Server]
charlie: [10.0.0.9, My Friend's Server]

[servers.aux]
os        : Ubuntu
version   : 22.04 LTS
start time: 14:03:59:10
```

</td></tr></table>

<br/>
Example Result (same for both):

```cs
get<string>("servers") => "
  alpha:  [10.0.0.2, My Home Server]
  bravo:  [10.0.0.7, My Work Server]
  charlie:[10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  }
"

get<string>("servers.alpha") => "[10.0.0.2, My Home Server]"
get<string[]>("servers.alpha") => { "10.0.0.2", "My Home Server" }

get<TimeSpan>("servers.aux.start time") => { 14 Days, 3 Hours, 59 Minutes, and 10 Seconds }
```