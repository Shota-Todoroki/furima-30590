const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); //この記述が無いと、このJavascript内の処理が行われる前に、HTMLの記述の処理が行われてしまい、トークンが発行されず、クレジット情報が剥き出しのまま、サーバーサイドに送られる。

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      //getの引数はそれぞれの入力フォームのname属性を指定する。
      number: formData.get("buy[number]"),
      cvc: formData.get("buy[cvc]"),
      exp_month: formData.get("buy[exp-month]"),
      exp_year: `20${formData.get("buy[exp-year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;//valueは実際に送られる値、nameはその値を示すプロパティ名（params[:name]のように取得できるようになる）を示す。
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);