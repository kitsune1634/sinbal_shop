import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1000 рублей"), value: "1000 рублей"),
      DropdownMenuItem(child: Text("3000 рублей"), value: "3000 рублей"),
      DropdownMenuItem(child: Text("5000 рублей"), value: "5000 рублей"),
    ];
    return menuItems;
  }

  String selectedValue = "1000 рублей";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Личные данные', style: TextStyle(
                fontSize: 18
            ),),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.account_circle_outlined, size: 20),
              title: Text('Моя информация'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(title: Text('Моя информация'),),
                          body: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Доставляем заказы во все города России.'),
                              ],
                            ),)
                      );
                    }));
              },
            ),

            ListTile(
              leading: Icon(Icons.chat_outlined, size: 20),
              title: Text('Обратная связь'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(title: Text('Обратная связь'),),
                          body: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Телефоны интернет-магазина:\n 8 (923) 456-78-10 и 8 (912) 345-67-89\n\n'
                                    'Электронный адрес: sinbal@gmail.com\n\n'
                                    'Инстаграмм: '),
                              ],
                            ),)
                      );
                    }));
              },
            ),
            SizedBox(height: 15),
            Text('Информация', style: TextStyle(
                fontSize: 18
            ),),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.card_giftcard, size: 20),
              title: Text('Подарочный сертификат'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(title: Text('Подарочный сертификат'),),
                          body: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ваша фамилия и имя'),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text('Ваш email'),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text('Ваш телефон'),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text('Выберите номинал'),
                                getDropdownButtonExample(),
                                SizedBox(height: 15,),
                                Center(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              3),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text("Заказать")),
                                )
                              ],
                            ),
                          ));
                    }));
              },
            ),

            ListTile(
              leading: Icon(Icons.local_shipping_outlined, size: 20),
              title: Text('Доставка'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(title: Text('Доставка'),),
                          body: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                    child: Text('Доставляем заказы по Барнаулу и в близлежащие районы.\n\n'
                                        'Сроки доставки зависят от региона.\n\n'
                                        'Стоимость: 399 рублей или бесплатно при покупке на сумму от 5000 рублей.\n\n'
                                        'Сроки: доставка товаров осуществляется курьером в будни с 10:00 до 18:00, а также в субботу с 11:00 до 17:00.')),
                              ],
                            ),)
                      );
                    }));
              },
            ),

            ListTile(
              leading: Icon(Icons.arrow_circle_left_outlined, size: 20),
              title: Text('Возврат'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(title: Text('Возврат'),),
                          body: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Возврат товара надлежащего качества, приобретенного в магазине.',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Вернуть новый товар, приобретенный в магазине можно в течении 7 календарных дней, начиная со следующего дня после получения товара.\n\n'
                                    'Для возврата нового товара необходимо связаться с менеджером по телефону 8 (923) 456-78-10 или элктроной почте sinbal@gmail.com для получния заявления на возврат.\n\n'
                                    'Возврат нового товара производится за счет Покупателя.\n\n'
                                    'При возврате нового товара, возвращаются денежные средства согласно цене в заказе. Стоимость доставки не возмещается, так как услуга была оказана.\n'),
                                Text('Возврат товара ненадлежащего качества, приобретенного в магазине.',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Вернуть товар ненадлежащего качества (ношеный, брак) можно в течении гарантийного срока.\n\n'
                                    'Для возврата товара в магазин ненадлежащего качества (ношенный, брак), а также в случае предъявления претензий к качеству товара.\n\n'
                                    'Для возврата нового товара необходимо связаться с менеджером по телефону 8 (923) 456-78-10 или элктроной почте sinbal@gmail.com для получния заявления на возврат.\n\n'
                                    'В периуд Гарантийного срока экспертиза товара проводится за счет Продавца. За пределами Гарантированого срока за счет Покупателя.'),
                              ],
                            ),)
                      );
                    }));
              },
            ),

            ListTile(
              leading: Icon(Icons.mail_outline, size: 20),
              title: Text('Контакты'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(title: Text('Контакты'),),
                          body: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Телефон: 8 (923) 456-78-10 (звонок бесплатный по всей России)\n\n'
                                    'Электронный адрес: sinbal@gmail.com\n\n'
                                    'Заказы оформленные через интернет-магазин обрабатывается круглосуточно.\n'),
                              ],
                            ),)
                      );
                    }));
              },
            ),

            ListTile(
              leading: Icon(Icons.aod, size: 20),
              title: Text('О приложении'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(title: Text('О приложении'),),
                          body: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sinbal - это бренд удобной обуви для женщин и мужчин.\n\n'
                                    'Через наше приложение вы можете легко выбирать и заказывать обувь, следить за акциями и специальными приложениями. В приложении Sinbal вы сможете найти идеальную пару обуви: от повседневной обуви до элегантных туфель.\n\n'
                                    'Миссия нашей компании: создавать стильные и качественные вещи.\n\n'
                                    'Мы предлагаем удобные условия возврата товара, чтобы сделать сделать ваш онлайн-шопинг простым и приятным.'),
                              ],
                            ),)
                      );
                    }));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getDropdownButtonExample() {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          filled: true,
          fillColor: Colors.white12,
        ),
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems);
  }
}