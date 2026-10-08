//Implement Circular Linked Lists and its operations: creation, insertion, deletion, traversal, search, reverse
#include <iostream>
using namespace std;

struct Node
{
    int data;
    Node *next;
};

Node *head = NULL;

void create()
{
    int n, value;

    cout << "Enter number of nodes: ";
    cin >> n;

    for (int i = 0; i < n; i++)
    {
        cout << "Enter value: ";
        cin >> value;

        Node *newNode = new Node;
        newNode->data = value;
        newNode->next = NULL;

        if (head == NULL)
        {
            head = newNode;
            newNode->next = head;
        }
        else
        {
            Node *temp = head;

            while (temp->next != head)
            {
                temp = temp->next;
            }

            temp->next = newNode;
            newNode->next = head;
        }
    }
}

void insert()
{
    int value, pos;

    cout << "Enter value to insert: ";
    cin >> value;

    cout << "Enter position: ";
    cin >> pos;

    Node *newNode = new Node;
    newNode->data = value;

    if (pos == 1)
    {
        if (head == NULL)
        {
            head = newNode;
            newNode->next = head;
        }
        else
        {
            Node *temp = head;

            while (temp->next != head)
            {
                temp = temp->next;
            }

            newNode->next = head;
            temp->next = newNode;
            head = newNode;
        }

        return;
    }

    Node *temp = head;

    for (int i = 1; i < pos - 1; i++)
    {
        temp = temp->next;

        if (temp == head)
        {
            cout << "Invalid position\n";
            delete newNode;
            return;
        }
    }

    newNode->next = temp->next;
    temp->next = newNode;
}

void deletion()
{
    int pos;

    cout << "Enter position to delete: ";
    cin >> pos;

    if (head == NULL)
    {
        cout << "List is empty\n";
        return;
    }

    Node *temp = head;

    if (pos == 1)
    {
        if (head->next == head)
        {
            delete head;
            head = NULL;
        }
        else
        {
            Node *last = head;

            while (last->next != head)
            {
                last = last->next;
            }

            head = head->next;
            last->next = head;

            delete temp;
        }

        return;
    }

    for (int i = 1; i < pos - 1; i++)
    {
        temp = temp->next;

        if (temp == head)
        {
            cout << "Invalid position\n";
            return;
        }
    }

    Node *del = temp->next;

    if (del == head)
    {
        cout << "Invalid position\n";
        return;
    }

    temp->next = del->next;
    delete del;
}

void traverse()
{
    if (head == NULL)
    {
        cout << "List is empty\n";
        return;
    }

    Node *temp = head;

    cout << "Circular Linked List: ";

    do
    {
        cout << temp->data << " ";
        temp = temp->next;
    }
    while (temp != head);

    cout << endl;
}

void search()
{
    int value, pos = 1;
    bool found = false;

    if (head == NULL)
    {
        cout << "List is empty\n";
        return;
    }

    cout << "Enter value to search: ";
    cin >> value;

    Node *temp = head;

    do
    {
        if (temp->data == value)
        {
            cout << "Element found at position " << pos << endl;
            found = true;
            break;
        }

        temp = temp->next;
        pos++;
    }
    while (temp != head);

    if (found == false)
    {
        cout << "Element not found\n";
    }
}

void reverse()
{
    if (head == NULL || head->next == head)
    {
        return;
    }

    Node *prev = NULL;
    Node *curr = head;
    Node *next = NULL;
    Node *last = head;

    while (last->next != head)
    {
        last = last->next;
    }

    do
    {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }
    while (curr != head);

    head->next = prev;
    head = prev;
    last->next = head;
}

int main()
{
    
}
