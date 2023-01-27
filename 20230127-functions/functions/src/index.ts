/* eslint-disable @typescript-eslint/no-unused-vars */
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();

const db = admin.firestore();

// usersコレクションにデータが追加されたら、purchaseHistoryに、コレクションデータを追加する.
// eslint-disable-next-line max-len, @typescript-eslint/no-unused-vars
exports.onUserCreate = functions.firestore.document("buyers/{buyerId}").onCreate(async (snap, context) => {
  const newValues = snap.data();
  // eslint-disable-next-line max-len
  await db.collection("purchaseHistory").add({
    name: `本の購入者は、${newValues.name}`,
    book: `購入した本は、${newValues.book}`,
    // price: `本の値段: ${newValues.buyerData.price}`,
    price: newValues.price as number,
  });
});

// eslint-disable-next-line max-len, @typescript-eslint/no-unused-vars
exports.onUserUpdate = functions.firestore.document("buyers/{buyerId}").onUpdate(async (snap, context) => {
  const newValues = snap.after.data();

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const updatePromises: any[] = [];

  const snapshot = await db.collection("purchaseHistory").get();
  // eslint-disable-next-line arrow-parens
  snapshot.forEach(doc => {
    updatePromises.push(db.collection("purchaseHistory").doc(doc.id).update({
      name: `本の購入者は、${newValues.name}`,
      book: `購入した本は、${newValues.book}`,
      price: newValues.price as number,
    }));
  });
  await Promise.all(updatePromises);
});

// eslint-disable-next-line max-len, @typescript-eslint/no-unused-vars
exports.onPostDelete = functions.firestore.document("buyers/{buyerId}").onDelete(async (snap, context) => {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const deletePromises: any[] = [];

  const snapshot = await db.collection("purchaseHistory").get();

  // eslint-disable-next-line arrow-parens
  snapshot.forEach(doc => {
    deletePromises.push(db.collection("purchaseHistory").doc(doc.id).delete());
  });
  await Promise.all(deletePromises);
});
