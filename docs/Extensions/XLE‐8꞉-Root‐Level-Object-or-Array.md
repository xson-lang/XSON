**Purpose:** JSON Compatibility

**Description:** 
An object or array can be declared, with no name or separator, at the root-level of an XSON file.
Functionally, an outer object is simply ignored, and an outer array is treated as an array with an empty name.

**Created On**: May 17th, 2023

**Status:** Active

**Examples:** 

<table><tr>

<th>Original</th><th>Root-Level Object</th><th>Root-Level Array</th>

</tr><tr><td>

```yaml
servers: {
  alpha:   [10.0.0.2, My Home Server]
  bravo:   [10.0.0.7, My Work Server]
  charlie: [10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  }
}
```  

</td><td>

```yaml
{
  servers: {
    alpha:   [10.0.0.2, My Home Server]
    bravo:   [10.0.0.7, My Work Server]
    charlie: [10.0.0.9, My Friend's Server]
    aux: {
      os        :  Ubuntu
      version   :  22.04 LTS
      start time:  14:03:59:10
    }
  }
}
```


</td><td>

```yaml
//This is just an array with one element
[
  // Remember that array values cannot have names 
  // (see XLE-3 for the relevant extension)
  {
    alpha:   [10.0.0.2, My Home Server]
    bravo:   [10.0.0.7, My Work Server]
    charlie: [10.0.0.9, My Friend's Server]
    aux: {
      os        :  Ubuntu
      version   :  22.04 LTS
      start time:  14:03:59:10
    }
  }
]
```

</td></tr></table>

<br/>
The result is the same for the original and the root-level object:

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

The root-level array however, is accessed differently:
```cs
get<string[]>("")[0] => "
  alpha:  [10.0.0.2, My Home Server]
  bravo:  [10.0.0.7, My Work Server]
  charlie:[10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  }
"

get<string[]>("")[0].get<string>("alpha") => "[10.0.0.2, My Home Server]"
get<string[]>("")[0].get<string[]>("alpha") => { "10.0.0.2", "My Home Server" }

get<string[]>("")[0].get<TimeSpan>("aux.start time") => { 14 Days, 3 Hours, 59 Minutes, and 10 Seconds }
```
This array is considered unnamed and thus you cannot have another unnamed array at the root level.