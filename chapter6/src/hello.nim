import threadpool
import os

type
  ThreadData = tuple[param: string, param2: int]

var data = "Hello World"

proc showData(data: ThreadData) {.thread.} =
  echo(data.param, data.param2)

proc countData(param: string) {.thread.} =
  for i in 0 .. <param.len:
    stdout.write($i)
  echo()

var thread: Thread[ThreadData]
createThread[ThreadData](thread, showData, (param: data, param2: 10))
joinThread(thread)

var threads: array[2, Thread[string]]
createThread[string](threads[0], countData, data)
createThread[string](threads[1], countData, data)
joinThreads(thread)

proc countData2(param: string) =
  for i in 0 .. <param.len:
    stdout.write($i)
  echo()

spawn countData2(data)
spawn countData2(data)

sync()

let lineFlowVar = spawn stdin.readLine()
while not lineFlowVar.isReady:
  echo("No input received.")
  echo("Will check again in 3 seconds.")
  sleep(3000)

echo("Input received: ", ^lineFlowVar)

proc crash(): string {.raises: [Exception].} =
  raise newException(Exception, "Crash")

let lineFlowVar2 = spawn crash()
sync()
