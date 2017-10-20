/* Algorithm from problem showing club that highlights a specific alrogithm
   that always leads to 4 */

#include <stdio.h>
using namespace std;
int main()
{
  int i = 0;
  double x_n = -1000.0;
  for (i = 0;i<100;i++)
    {
      cout << i << "\t" << x_n;
      x_n = 3.0 + (4.0/x_n);
    }
  return 0;
}
