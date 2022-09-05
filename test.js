function hello() {
  console.log("Hello World");
}

function withWrapper(params) {
  function wrapper(params) {
    console.log(params);
  }
  return wrapper(params);
}

const testFunc = (params) => {
  console.log(params);
};

const wrapperTestFunc = (params) => {
  testFunc(params);
};
