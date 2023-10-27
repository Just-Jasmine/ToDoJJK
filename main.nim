import terminal, strutils


#[
  ToDo: (Ironic, I know)
  1.) persistence
  2.) moveEntry
]#

# Removes a todo entry
proc removeEntry(entries: var seq[string]) =
  var input: int
  stdOut.writeLine("What entry would you like to remove,")
  for i, e in entries:
    stdOut.writeLine(i + 1, ".) ", entries[i])
  while true:
    try:
      input = parseInt($getch())
      entries.delete(input + 1)
    except:
      echo("Please input a valid number: ")
      continue
    break
  return


#[
proc moveEntry(entries: var seq[string]) =
  var 
    input: int
    toMove: string
  stdOut.writeLine("What entry would you like to move,")
  for i, e in entries:
    stdOut.writeLine(i + 1, ".) ", entries[i])
  while true:
    try:
      input = parseInt($getch())
      entries.add("")
      toMove = entries[input + 1]
      entries.delete(input + 1)
    except:
      echo("Please input a valid number: ")
      continue
    break
  echo("where would you like to move it?")
  for i, e in entries:
    stdOut.writeLine(i + 1, ".) ", entries[i])
  while true:
    try:
      input = parseInt($getch())
      entries.insert(toMove, input + 1)
    except:
      echo("Please input a valid number: ")
      continue
    for i in 0..1:
      entries.delete(entries.find(""))
    break
  return
]#


proc printEntries(entries: var seq[string]) =
  for i, e in entries:
    echo(i + 1, ".) ", entries[i])
  return

# Gets input from the user
proc getEntry(query: string): string =
  echo(query)
  return readLine(stdin)

proc processInput(entries: var seq[string]) =
  while true:
    var input = $getch().toUpperAscii()
    case input
    of "A":
      entries.add(getEntry("What do you need to do?: "))
      break
    of "V":
      printEntries(entries)
      break
    #[
    of "M":
      moveEntry(entries)
      break
    ]#
    of "R":
      removeEntry(entries)
      break
    else: 
      echo("Please input a valid entry: ")
      continue
  return

# Entry Point
proc toDo() =

  var entries: seq[string] = @[]

  echo("Welcome to ToDoJJk!")
  echo("")

  while true:
    echo("Would you like to Add(a), View(v), or Remove(r)?")
    processInput(entries)
    continue
    
  return

toDo()