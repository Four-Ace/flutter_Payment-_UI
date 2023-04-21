import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white.withOpacity(0.8),
                    size: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hola, Amiga♥',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      Text(
                        'Buneos dias!',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$ 5194 482',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button(
                    bgColor: Color(0xfff1b33b),
                    textColor: Colors.black,
                    text: 'Transfer',
                  ),
                  button(
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                    text: 'Request',
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const currencyCard(
                name: 'Euro',
                amount: '6 427',
                code: 'EUR',
                icon: Icons.euro_rounded,
                isInverted: false,
              ),
              const currencyCard(
                name: 'Bitcoin',
                amount: '12 750',
                code: 'BTC',
                icon: Icons.currency_bitcoin_rounded,
                isInverted: true,
              ),
              const currencyCard(
                name: 'Dollar',
                amount: '685',
                code: 'USD',
                icon: Icons.euro_rounded,
                isInverted: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
