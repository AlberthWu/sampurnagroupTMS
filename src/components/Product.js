import { useEffect } from "react";
import { Card } from "primereact/card";
import { Button } from "primereact/button";
import { useHookstate } from "@hookstate/core";
import { classNames } from "primereact/utils";
// import { Input } from "primereact/inputtext";
import "/node_modules/primeflex/primeflex.css";

const Product = () => {
  const productState = useHookstate([]);

  useEffect(() => {
    fetch("https://fakestoreapi.com/products")
      .then((response) => response.json())
      .then((data) => productState.set(data));
  }, [productState]);

  const formatPrice = (price) => {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
    }).format(price);
  };

  const getCardStyleClass = () => {
    return classNames("p-m-2 p-md-3 p-lg-4 p-flex-grow-1", {
      "p-col-12 p-md-6 p-lg-4": productState.length <= 3,
      "p-col-12 p-md-6 p-lg-3":
        productState.length > 3 && productState.length <= 6,
      "p-col-12 p-md-6 p-lg-2": productState.length > 6,
    });
  };

  return (
    // <div className="d-flex">
    <div className="p-grid p-justify-center">
      {productState.length > 0 &&
        productState.map((data) => (
          <div key={data.id.get()} className={getCardStyleClass()}>
            <Card
              title={data.title.get()}
              subTitle={formatPrice(data.price.get())}
              footer={
                <div className="p-d-flex p-jc-center p-mt-3">
                  <Button label="Buy Now" />{" "}
                </div>
              }
              header={<img src={data.image.get()} />}
              className="md:w-25rem"></Card>
          </div>
        ))}
    </div>
    // </div>
  );
};

export default Product;
