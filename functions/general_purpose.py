import uuid


def create_unique_id(account):
    id = str(uuid.uuid4())
    id_account = id+account
    return id_account

def get_nodes(subscription):
    nodes = {'node2': '@', 'node3': '#', 'node4': '.'}
    for n in nodes:
        if subscription.find(nodes[n]) is not -1:
            nodes[n] = nodes[n] + subscription.split(nodes[n])[1]
            if nodes[n].find("#") is not -1 or nodes[n].find("@") is not -1:
                nodes[n] = nodes[n].split(".")[0]
            if nodes[n].find("@") is not -1:
                nodes[n] = nodes[n].split("#")[0]
        else:
            nodes[n] = ''
    return nodes

print(get_nodes(".denis"))