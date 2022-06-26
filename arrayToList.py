from ListNode import *

def arrayToList(values):
   prev = None
   head = None
   for value in values:
    current = ListNode(value)
    if head is None:
        head = current
    if prev is not None:
        prev.next = current
    prev = current
   return head
  