{% docs purchase_segment %}
Categorización de la compra a partir de `total_orders`.

| purchase_segment  | Regla              |
|-------------------|--------------------|
| never_bought      | total_orders = 0   |
| one_purchase      | total_orders = 1   |
| two_purchases     | total_orders = 2   |
| three_or_more     | total_orders >= 3  |

{% enddocs %}