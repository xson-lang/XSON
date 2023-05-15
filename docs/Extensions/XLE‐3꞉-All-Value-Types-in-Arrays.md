**Purpose:** Extra Functionality; JSON Compatibility

**Description:** 
Any unamed value (i.e objects and arrays), not just strings, can also be part of an array collection.
In other words, all value types are allowed as array values.
Functionally, array values still work the same, and are still referred to by index.

**Created On**: May 15th, 2023

**Status:** Active

**Examples:** 

<table><tr>

<th>Original</th><th>As Array</th>

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

```yaml 
servers: [
  [10.0.0.2, My Home Server]
  [10.0.0.7, My Work Server]
  [10.0.0.9, My Friend's Server]
  {
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  ]
]
```

</td></tr></table>

<br/>
Referencing Example:


<table><tr>

<th>Original</th><th>As Array</th>

</tr><tr><td>

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

get<TimeSpan>("servers.aux.start time") => { 14d, 3h, 59m, and 10s }
```

</td><td>

```cs
get<string>("servers") => {
  "[10.0.0.2, My Home Server]",
  "[10.0.0.7, My Work Server]",
  "[10.0.0.9, My Friend's Server]",
  "{
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  }"
}

get<string[]>("servers").get<string>(0) => "[10.0.0.2, My Home Server]"
get<string[]>("servers").get<string[]>(0) => { "10.0.0.2", "My Home Server" }

get<string[]>("servers").get<string>(3).get<TimeSpan>("start time") => { 14d, 3h, 59m, and 10s }
```

</td></tr></table>
