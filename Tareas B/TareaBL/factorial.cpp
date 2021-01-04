#include <iostream>
using namespace std;

int main() {
	int n;
	int cont = 1;
	int ans = 1;
	cout << "Ingrese N: \n";
	cin >> n;
	
	if(n >= 0){
		if(n >1)
			for(int i = 1; i <= n; i++)
				ans*=i;
		
		cout <<n<<"! = "<<ans;
	}
	else{
		cout << "El operador es invalido";
	}
	return 0;
}