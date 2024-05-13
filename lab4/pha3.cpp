#include <iostream>
using namespace std;
int main()
{
    for (int input1 = 0; input1 <= 5; input1++)
    {
        int v5 = 0;
        switch (input1)
        {
        case 0:
            v5 += 390;
            goto LABEL_5;
        case 1:
        LABEL_5:
            v5 -= 217;
            goto LABEL_6;
        case 2:
        LABEL_6:
            v5 += 380;
            goto LABEL_7;
        case 3:
        LABEL_7:
            v5 -= 575;
            goto LABEL_8;
        case 4:
        LABEL_8:
            v5 += 575;
            goto LABEL_9;
        case 5:
        LABEL_9:
            v5 -= 575;
            goto LABEL_10;
        case 6:
        LABEL_10:
            v5 += 575;
            break;
        case 7:
            break;
        default:
            cout << "nooo\n";
        }
        v5 -= 575;

        cout << "input1: " << input1 << endl;
        cout << "input2: " << v5 << endl;
    }
}
