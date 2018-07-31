
javascript:

/*# genders F/M ?? */
/*# genders mannualy but why ?? */
/*# seat SU/SL/UB/LB/MB/WS ?? */
mobile = '7579074832';
name1 = 'First Last';
age1  = '25';
gender1 = 'M';
seat1   = 'SU';

/*# login page */
userID = 'user1';
userPass = 'pass1';

/* #old-start
function D(a,b){c=b.split('|');d=false;for(q=0;q<c.length;q++){if(c[q]==a)d=true;}return d;}function E(){f0=document.forms['addPassengerForm']||document.forms['jpBook'];if(f0['addPassengerForm:psdetail:0:psgnName'])f0['addPassengerForm:psdetail:0:psgnName'].value=name1;dq=document.querySelector('input[size=\'16\'][id^=\'addPassengerForm:psdetail:0:\']'); if(dq)dq.value=name1;if(f0['addPassengerForm:psdetail:0:psgnAge'])f0['addPassengerForm:psdetail:0:psgnAge'].value=age1;if(f0['addPassengerForm:psdetail:0:psgnGender'])f0['addPassengerForm:psdetail:0:psgnGender'].value=gender1;if(f0['addPassengerForm:psdetail:0:berthChoice'])f0['addPassengerForm:psdetail:0:berthChoice'].value=seat1;if(f0['addPassengerForm:mobileNo'])f0['addPassengerForm:mobileNo'].value=mobile;if(f0['addPassengerForm:onlyConfirmBerths']){f0['addPassengerForm:onlyConfirmBerths'].checked=true;f0['addPassengerForm:onlyConfirmBerths'].removeAttribute('disabled');}}


function E() {f0 = document.forms['addPassengerForm'] || document.forms['jpBook'] || document.forms['jpform'];function F1(el, val) {if (document.getElementById(el) && val != '') document.getElementById(el).value = val; }if (document.forms['loginFormId']) {F1('usernameId', userID);document.getElementsByClassName('loginPassword').j_password.value = userPass;};if (document.forms['jpform']) {F1('jpform:fromStation', 'HABIBGANJ - HBJ');F1('jpform:toStation', 'WANKANER JN - WKR');F1('jpform:journeyDateInputDate', '25-04-2018');F1('ticketType', 'E_TICKET');};var elements = document.getElementsByName('quota');for (i = 0; i < elements.length; i++) {if (elements[i].value == 'TQ') {elements[i].checked = true;}}if (f0['addPassengerForm:psdetail:0:psgnName']) f0['addPassengerForm:psdetail:0:psgnName'].value = name1;dq = document.querySelector('input[size=\'16\'][id^=\'addPassengerForm:psdetail:0:\']');if (dq) dq.value = name1;if (f0['addPassengerForm:psdetail:0:psgnAge']) f0['addPassengerForm:psdetail:0:psgnAge'].value = '25';if(f0['addPassengerForm:psdetail:0:psgnGender'])f0['addPassengerForm:psdetail:0:psgnGender'].value=gender1;if (f0['addPassengerForm:psdetail:0:berthChoice']) f0['addPassengerForm:psdetail:0:berthChoice'].value = seat1;if (f0['addPassengerForm:mobileNo']) f0['addPassengerForm:mobileNo'].value = mobile;if (f0['addPassengerForm:autoUpgrade']) {f0['addPassengerForm:autoUpgrade'].checked = true;f0['addPassengerForm:autoUpgrade'].removeAttribute('disabled');}if (f0['addPassengerForm:onlyConfirmBerths']) {f0['addPassengerForm:onlyConfirmBerths'].checked =  true;f0['addPassengerForm:onlyConfirmBerths'].removeAttribute('disabled');}function D(n,t){for(c=t.split('|'),d=!1,q=0;q<c.length;q++)c[q]==n&&(d=!0);return d}if (document.forms['jpBook']) {try { if(document.getElementsByClassName('NETBANKING')[0].style.display == 'none')eval(document.getElementById('NETBANKING').getAttribute('onclick'));} catch (err) {}};}
 #old-end */

function E() {f0 = document.forms['addPassengerForm'] || document.forms['jpBook'] || document.forms['jpform'];function F1(el, val) {if (document.getElementById(el) && val != '') document.getElementById(el).value = val; }if (document.forms['loginFormId']) {F1('usernameId', userID);document.getElementsByClassName('loginPassword').j_password.value = userPass;};if (document.forms['jpform']) {F1('jpform:fromStation', 'HABIBGANJ - HBJ');F1('jpform:toStation', 'WANKANER JN - WKR');F1('jpform:journeyDateInputDate', '25-04-2018');F1('ticketType', 'E_TICKET');};var elements = document.getElementsByName('quota');for (i = 0; i < elements.length; i++) {if (elements[i].value == 'TQ') {elements[i].checked = true;}}if (f0['addPassengerForm:psdetail:0:psgnName']) f0['addPassengerForm:psdetail:0:psgnName'].value = name1;dq = document.querySelector('input[size=\'16\'][id^=\'addPassengerForm:psdetail:0:\']');if (dq) dq.value = name1;if (f0['addPassengerForm:psdetail:0:psgnAge']) f0['addPassengerForm:psdetail:0:psgnAge'].value = '25';if (f0['addPassengerForm:psdetail:0:berthChoice']) f0['addPassengerForm:psdetail:0:berthChoice'].value = seat1;if (f0['addPassengerForm:mobileNo']) f0['addPassengerForm:mobileNo'].value = mobile;if (f0['addPassengerForm:autoUpgrade']) {f0['addPassengerForm:autoUpgrade'].checked = true;f0['addPassengerForm:autoUpgrade'].removeAttribute('disabled');}if (f0['addPassengerForm:onlyConfirmBerths']) {f0['addPassengerForm:onlyConfirmBerths'].checked =  true;f0['addPassengerForm:onlyConfirmBerths'].removeAttribute('disabled');}function D(n,t){for(c=t.split('|'),d=!1,q=0;q<c.length;q++)c[q]==n&&(d=!0);return d}if (document.forms['jpBook']) {try { if(document.getElementsByClassName('NETBANKING')[0].style.display == 'none')eval(document.getElementById('NETBANKING').getAttribute('onclick'));} catch (err) {}};}


/* #TODO */
/*# Test: UPI */
/*# Setup Irctc Wallet: */
/*# Auto fill chrome extenstion*/
/*# Account:panvoda:Hello123*/



/*# Set Variables */

/* # Train Details */
/* # Coaches SL/3A/2A/CC/2S */
/* # Quota TQ/GN */
trainNumber = "11464";
trainCoach  = "SL";
trainQuota  = "TQ";

/* # UPI BHIM */
/* # Note: use Axis, Tez(finger lock), bhim(many questions)*/
/*
method = "upiAxis";
upiVPA = "name@okaxis";
*/
/*upiVPA = "name1@axisbank";*/
/*upiVPA = "name2@axisbank";*/
/*upiVPA     = "name3@okaxis";*/


/* # sbiNet Info */
/*method = "sbiNet";*/
/*sbiNetName = "fkaj";*/
/*sbiNetPass = "fkajkfj";*/

/* # sbiDeb */
method = "sbiDeb";
cardNumber = "5175740001510000";
cardYear   = "2000";
cardMonth1 = "7";
cardName   = "Name On Card";
cardPin    = "0000";

/* # paytmDeb */
/*method = "paytmDeb";*/
/*cardNumber = "4637860106910000";*/
/*cardYear   = "2000";*/
/*cardMonth2 = "07";*/
/*cardCVV    = "000";  */

/* # axisDeb */
/*
method = "axisDeb";
cardNumber = "4505020014420000";
cardYear   = "2000";
cardMonth1  = "2";
cardName   = "Name of card";
cardPin    = "0000";
 */

/* # irctc eWallet */
/*method     = "eWallet";*/
/*eWalletPin = "wallet Pin";*/


function selectPay(){
  if (method=="sbiNet")SBINet();
  if (method=="sbiDeb")SBIDeb();
  if (method=="upiAxis")upiAxis();
  if (method=="paytmDeb")paytmDeb();
  if (method=="axisDeb")axisDeb();
  if (method=="eWallet")eWallet();
};

function setID(id,val){
  if(document.getElementById(id))document.getElementById(id).value=val;
};

function upiAxis(){
	if (document.forms['jpBook']) {
		checkSearchType('UPI_VPA');
		dq=document.querySelector('input[type=\'radio\'][name=\'UPI_VPA\'][value=\'97\']');
		if(dq){
			dq.click();
			if(document.getElementById("validate"))document.getElementById("validate").click();
    };
  };
  if (document.forms['vpaForm']){
		document.getElementById("vpa").value=upiVPA;
    if(document.getElementById("payNow"))document.getElementById("payNow").click();
  };
  /*#TODO : check whathappens after payment*/
};

function eWallet(){
	if (document.forms['jpBook']) {
    checkSearchType('E_WALLET');

    if(document.getElementById("jpBook:rdsTxnPswd")){
      setID("jpBook:rdsTxnPswd", eWalletPin);
			if(document.getElementById("validate"))document.getElementById("validate").click();
    };
  };
	if (document.forms['eWalletPmtCnf']) {

      captcha=document.querySelector('input[name=\'j_captcha\']');
      function focusCaptcha() {
        if(document.getElementById("eWalletPmtCnf:confOTP"))document.getElementById("eWalletPmtCnf:confOTP").focus();
        captcha.focus();
      };
      if(captcha.value.length>=4){
        if(document.getElementById("eWalletPmtCnf:confOTP"))document.getElementById("eWalletPmtCnf:confOTP").click();
      }
      else {
        focusCaptcha();
      };
  };
};

function paytmDeb(){
	if (document.forms['jpBook']) {
    checkSearchType('AGGREGATOR');
		dq=document.querySelector('input[type=\'radio\'][name=\'AGGREGATOR\'][value=\'78\']');
		if(dq){
			dq.click();
			if(document.getElementById("validate"))document.getElementById("validate").click();
    };
  };

	if(document.getElementById("cn1") && document.getElementById("dcSubmit")){
		setID("cn1", cardNumber);
		setID("dcExpMonth", cardMonth2);
		setID("dcExpYear", cardYear);
		setID("dcCvvBox", cardCVV);
    if(document.getElementById("dcSubmit"))document.getElementById("dcSubmit").click();
	};

  /*# Sbi Debit*/
	if (document.forms['form1']) {
		dq=document.querySelector('input[name=\'customerotp\']');
    if(dq ){
      if(dq.value=='')dq.select();
      else ValidateForm();
    };
  };
};

function SBINet(){
	if (document.forms['jpBook']) {
		checkSearchType('NETBANKING');
		dq=document.querySelector('input[type=\'radio\'][name=\'NETBANKING\'][value=\'1\']');
		if(dq){
			dq.click();
			if(document.getElementById("validate"))document.getElementById("validate").click();
		};
	};
	if(document.getElementById("username")&&document.getElementById("label2")){
    /* #TODO : Edited, check once */
		document.getElementById("username").value=sbiNetName;
		document.getElementById("label2").value=sbiNetPass;
		if(document.getElementById("Button2"))document.getElementById("Button2").click();
		if(document.querySelector('[title="Login"]'))document.querySelector('[title="Login"]').click();
	};
	if(document.getElementById("Go"))document.getElementById("Go").click();
	if(document.getElementById("onlineOTP")){
		document.getElementById("onlineOTP").click();
		if(document.getElementById("confirmButton"))document.getElementById("confirmButton").click();
	};
	dqPass=document.querySelector('input[size=\'20\'][name=\'securityPassword\']');
	if(dqPass){
		if(dqPass.value=='')dqPass.select();
		else if(document.getElementById("confirmButton"))document.getElementById("confirmButton").click();
	};

};

function SBIDeb(){
	if (document.forms['jpBook']) {
		checkSearchType('DEBIT_CARD');
		dq=document.querySelector('input[type=\'radio\'][name=\'DEBIT_CARD\'][value=\'3\']');
		if(dq){
			dq.click();
			if(document.getElementById("validate"))document.getElementById("validate").click();
		};
	};
	if(document.getElementById("debitCardNumber")){
		setID("debitCardNumber", cardNumber);
		setID("debiMonth", cardMonth1);
		setID("debiYear", cardYear);
		setID("debitCardholderName", cardName);
		setID("cardPin", cardPin);
		if(document.getElementById("passline")){
			if(document.getElementById("passline").value=='')document.getElementById("passline").select();
			else if(document.getElementById("proceed"))document.getElementById("proceed").click();
		}
		else if(document.getElementById("proceed"))document.getElementById("proceed").click();
	};
};

function axisDeb(){
	if (document.forms['jpBook']) {
    checkSearchType('DEBIT_CARD');
		dq=document.querySelector('input[type=\'radio\'][name=\'DEBIT_CARD\'][value=\'66\']');
		if(dq){
			dq.click();
			if(document.getElementById("validate"))document.getElementById("validate").click();
		};
  };
	if(document.getElementById("debitCardNumber")){
		setID("debitCardNumber", cardNumber);
		setID("debiMonth", cardMonth1);
		setID("debiYear", cardYear);
		setID("debitCardholderName", cardName);
		setID("cardPin", cardPin);
		if(document.getElementById("passline")){
			if(document.getElementById("passline").value==''){
        if(document.getElementById("proceed"))document.getElementById("proceed").focus();
        document.getElementById("passline").select();
      }
			else if(document.getElementById("proceed"))document.getElementById("proceed").click();
		}
		else if(document.getElementById("proceed"))document.getElementById("proceed").click();
	};
};

function formPassenger(){
	if(document.forms['addPassengerForm']){
		wait = 5500;
		if(document.getElementById("addPassengerForm:psdetail:0:psgnAge")){
			ageField=document.getElementById("addPassengerForm:psdetail:0:psgnAge");
			if(ageField.value==''){
				wait = 25000;
				E();
			};
			if(ageField.value!=''){
				if(document.getElementById("j_captcha") || document.getElementById("nlpAnswer")){
					captcha=document.getElementById("j_captcha");
          if(document.getElementById("nlpAnswer"))captcha=document.getElementById("nlpAnswer");

					function focusCaptcha() {
						if(document.getElementById("validate"))document.getElementById("validate").focus();
						captcha.focus();
					}
					function validate(){
						if(captcha.value.length>=4){
							if(document.getElementById("validate"))document.getElementById("validate").click();
						}
						else {
							focusCaptcha();
							/*setTimeout(function(){validate();},1000);*/
						};
					};
					if(captcha.value==''){
						focusCaptcha();
						if(wait)setTimeout(function(){validate();},wait);
					}
					else validate();
				};
			};
		};
	};
};

function formSelectTrain(){
	if(document.forms['avlAndFareForm']){
    coachID = "cllink-" + trainNumber + "-" + trainCoach + "-" ;
    bookID  = trainNumber + "-" + trainCoach + "-" + trainQuota + "-0";

		dq=document.querySelector('input[type=\'radio\'][name=\'quota\'][value="' + trainQuota + '"]');
    if(dq)dq.click();

		coach=document.querySelector('[id^=' + coachID + ']');
    /*coach=$('[id^=' + coachID + ']');*/

    function bookStart(i=100){
      /*if(coach)coach.click();*/
      book=document.getElementById(bookID);
      if(book){
        /*d2 = new Date();*/
        /*alert(d2.toTimeString()+ " "+ d2.getMilliseconds() +" in book " + (d2.getTime()-d.getTime()));*/
        book.click();
      } else {
        if(i==0){coach.click(); i=100; };
        setTimeout(function(){bookStart(i-1);},10);
      };
    };

    if(coach){
      coach.click();
      d = new Date();
      m = d.getMinutes();
      s = d.getSeconds();
      if(m>55)setTimeout(function(){if(dq)dq.click(); bookStart(50);},
                         ((60-m)*60 -s)*1000-d.getMilliseconds());
      else bookStart();

    } else alert(coachID + " Coach not Found");

  };
};

function irctcAuto(){
	if(document.forms['avlAndFareForm'])formSelectTrain();
	if(document.forms['addPassengerForm'])formPassenger();
	if(document.getElementById("altavlfrm:continue"))document.getElementById("altavlfrm:continue").click();

};

void(document.oncontextmenu=null);
irctcAuto();
selectPay();
