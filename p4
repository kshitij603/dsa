//Implement Towers of Hanoi using Stack
#include <iostream>
using namespace std;

#define MAX 100

int stack[3][MAX];
int top[3] = {-1, -1, -1};

void push(int rod, int disk)
{
    top[rod]++;
    stack[rod][top[rod]] = disk;
}

int pop(int rod)
{
    int disk = stack[rod][top[rod]];
    top[rod]--;
    return disk;
}

void moveDisk(int from, int to)
{
    int disk = pop(from);
    push(to, disk);

    cout << "Move disk " << disk
         << " from " << char('A' + from)
         << " to " << char('A' + to) << endl;
}

void hanoi(int n, int from, int to, int aux)
{
    if (n == 1)
    {
        moveDisk(from, to);
        return;
    }

    hanoi(n - 1, from, aux, to);
    moveDisk(from, to);
    hanoi(n - 1, aux, to, from);
}

int main()
{
    int n;

    cout << "Enter number of disks: ";
    cin >> n;

    // Put all disks on first rod
    for (int i = n; i >= 1; i--)
    {
        push(0, i);
    }

    cout << "\nSteps to solve Towers of Hanoi:\n";

    hanoi(n, 0, 2, 1);

    return 0;
}
