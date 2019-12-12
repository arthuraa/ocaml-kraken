side:`buy`sell
ordType:`limit`market
ledgerType:`deposit`withdrawal`trade`transfer
txStatus:`Success`Failure`Partial`Settled
exchange:`KRK`GIO

orders:([]
 time:`timestamp$();
 sym:`symbol$();
 exchange:`exchange$();
 id:`guid$();
 side:`side$();
 ordType:`ordType$();
 price:`float$();
 qty:`float$();
 execQty:`float$();
 cost:`float$();
 fee:`float$();
 stopPrice:`float$();
 limitPrice:`float$())

trades:([]
 time:`timestamp$();
 sym:`symbol$();
 exchange:`exchange$();
 id:`guid$();
 oid:`guid$();
 side:`side$();
 ordType:`ordType$();
 price:`float$();
 qty:`float$())

ledgers:([]
 time:`timestamp$();
 sym:`symbol$();
 exchange:`exchange$();
 typ:`ledgerType$();
 id:`guid$();
 refid:`guid$();
 amount:`float$();
 fee:`float$())

transfers:([]
 time:`timestamp$();
 sym:`symbol$();
 exchange:`symbol$();
 kind:`ledgerType$();
 status:`txStatus$();
 id:`guid$();
 txID:(); / TxID in string format
 addr:(); / Addr in string format
 amount:`float$();
 fee:`float$())

upd:insert

\p 5042
\c 100 2048

refidOfId:{xcol[(`id,())!(x,());y]}

tForJoin:refidOfId[`refid] `id xkey trades
oForJoin:refidOfId[`oid] `id xkey orders
ledgers lj tForJoin
trades lj oForJoin
orders
transfers

