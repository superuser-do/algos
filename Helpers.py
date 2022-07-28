class ListNode:
    def __init__(self, value = 0, next = None):
        self.value = value
        self.next = next

def listToArray(head) -> [int]:
    array = []
    ptr = head
    while ptr != None:
        array.append(ptr.value)
        ptr = ptr.next
    return array

def arrayToLinkedList(values):
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

class TreeNode:
    def __init__(self, value = 0, left = None, right = None):
        self.value = value
        self.left = left
        self.right = right

def treeToArray(root):
    if not root:
        return []
    
    queue = [root]
    array = []
    while (len(queue) != 0):
        node = queue.pop(0)
        array.append(node.value)
        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)
    return array

def arrayToTree(array):
    if not array:
        return TreeNode(None)
    mid = len(array) // 2
    node = TreeNode(array[mid])
    node.left = arrayToTree(array[:mid])
    node.right = arrayToTree(array[mid+1:])
    return node