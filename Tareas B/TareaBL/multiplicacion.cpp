#include <iostream>
using namespace std;

int main() {
	int n,m;
	int cont = 0;
	int ans = 0;
	cout << "Ingrese N: \n";
	cin >> n;
	cout << "Ingrese M: \n";
	cin >> m;
	
	if(n >= 0 && m >= 0){
		if(m > n){
			int aux;
			aux = m;
			m = n;
			n = aux;
		}

		for(int i = 0; i < m; i++){
			ans += n;
		}
		cout <<"El resultado es: "<<ans;
	}
	else{
		cout << "Los operandos son invalidos (uno o ambos son menor a cero) \n" <<n<<","<<m;
	}
	return 0;
}