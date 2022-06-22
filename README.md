# credit_simulator

A Rispar é a primeira plataforma de crédito com garantia em bitcoins do Brasil.
Através da plataforma, o usuário tem acesso a linhas de crédito vantajosas, com juros
baixos e crédito rápido, possibilitados pelo Bitcoin como ativo em garantia.
<br>

---
Link vercel app: https://credit-simulator-rispar.vercel.app/#/

URL: https://api.rispar.com.br/acquisition/simulation<br>
Method: POST

Body:
```
{
"fullname": "string", // Nome Completo
"email": "string", // E-mail
"ltv": "integer [20, 35, 50]", // Percentual da Garantia
"amount": "decimal", // Valor escolhido
"term": "integer [3, 6, 9, 12]", // Prazo
"has_protected_collateral": "boolean" // Garantia Protegida
}
```
<br>
<h2 align="center">Como Usar 🤔</h2>

   ```
   - Clone esse repositório:
   $ git clone https://github.com/Mathvdias/credit_simulator_rispar.git

   - Entre no diretório:
   $ cd credit_simulator_rispar

   - Instale as dependências:
   $ flutter pub get

   - Inicie o app: 
   $ flutter run
   ```

<h2 align="center">Layout 🎨</h2>

<div align="center">
<img align="center" src="https://user-images.githubusercontent.com/74201503/174899863-7bcd1328-c580-43e8-91bc-404fa7349180.png" width="200" height="400"/>
<img align="center" src="https://user-images.githubusercontent.com/74201503/174900134-ec993c74-c91b-4c79-a6e2-aeaa08590f88.png" width="200" height="400"/>
<img align="center" src="https://user-images.githubusercontent.com/74201503/174900164-6924fa61-e101-49cc-a1da-0a4662f5a251.png" width="200" height="400"/>
<img align="center" src="https://user-images.githubusercontent.com/74201503/174932828-7065059c-a836-427f-922a-5e14afadf589.png" width="200" height="400"/>
</div>
<h2 align="center">O app foi feito utilizando: 📖</h2>
<p>
<h2>

`SharedPreferences`, `Provider`, `Intl`, `DIO`, `Flutter_SVG`.
   


