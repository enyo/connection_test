part of connection_test;
/**
 * Location model
 */
@Kind()
class Pricing extends Entity {

  static const String kindName = 'Pricing';

  @constructKind
  Pricing._(Key key, [String currency, int amount]) :
      super(key, {
        'currency' : currency,
        'amount' : amount
      });

  /**
   * A unique identifier for the location.
   */
  int get id => key.id;

  @Property()
  String get currency => getProperty('currency');

  @Property()
  int get amount => getProperty('amount');

  /**
   * Lookup the location by it's id
   */
  static Future<EntityResult> lookupById(Datastore datastore, int id) =>
      datastore.lookup(new Key(kindName, id: id));

  static Future<Pricing> create(Datastore datastore, String currency, int amount) {

    Pricing newPricing;
    return datastore.allocateKey(kindName)
        .then((key) {
          return new Pricing._(key, currency, amount);
        })
        .then((Pricing pricing) {
          newPricing = pricing;
          return datastore.insert(pricing);
        })
        .then((_) {
          return newPricing;
        });

  }

  String toString() => '$kindName ($id, $currency, $amount)';

}

