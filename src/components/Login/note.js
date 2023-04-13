// import React, { useState } from "react";
// import { InputText } from "primereact/inputtext";
// import { Button } from "primereact/button";
// import axios from "axios";
// import Cookies from "js-cookie";

// const Login = () => {
//   const [email, setEmail] = useState("");
//   const [password, setPassword] = useState("");
//   const [isLoggedIn, setIsLoggedIn] = useState(false);
//   // const url = "https://api.sampurna-group.com/v2/users/";
//   const url2 = "http://10.2.3.155:9080/v2/users/";

//   const handleLogin = () => {
//     // http://10.3.2.3:155:9080 fetch("https://api.sampurna-group.com/v2/users/login", {
//     //   method: "POST",
//     //   credentials: "include",
//     //   headers: {
//     //     "Content-Type": "application/json",
//     //   },
//     // })
//     //   .then((res) => {
//     //     res.json();
//     //     console.log(res.headers.Cookies);
//     //   })
//     //   .catch((err) => {
//     //     console.log(err);
//     //   });
//     const currentDate = new Date();
//     const oneHourFromNow = new Date(currentDate.getTime() + 60 * 60 * 1000);
//     axios
//       .post(
//         `${url2}login`,
//         {
//           email,
//           password,
//           // enables cookies to be sent with the request
//         },
//         {
//           withCredentials: true,
//         }
//       )
//       .then((response) => {
//         console.log(response.headers);
//         console.log(response.data);
//         // Cookies.set("access_token", response.data.session_id, {
//         //   path: "/",
//         //   expires: oneHourFromNow,
//         // });
//         // Cookies.set("access_token", response.headers["Set-Cookie"]);
//         setIsLoggedIn(true);
//       })
//       .catch((error) => console.log(error));
//   };

//   const handleRefresh = () => {
//     const access_token = Cookies.get("access_token");
//     const currentDate = new Date();
//     const oneHourFromNow = new Date(currentDate.getTime() + 60 * 60 * 1000);
//     // console.log(Cookies.get("access_token"));
//     axios
//       .post(
//         `${url2}refresh`,
//         // {}
//         {
//           headers: {
//             withCredentials: true,
//             Authorization: `bearer ${access_token}`,
//           },
//         }
//       )
//       .then((response) => {
//         console.log(Cookies.get("access_token"));
//         // console.log(response);
//         Cookies.set("access_token", response.data.access_token, {
//           expires: oneHourFromNow,
//         });
//       })
//       .catch((error) => console.log(error));
//   };

//   const handleLogout = () => {
//     const access_token = Cookies.get("access_token");
//     console.log(access_token);

//     axios
//       .post(
//         `${url2}logout`,
//         {},
//         {
//           headers: {
//             Authorization: `Bearer ${access_token}`,
//           },
//         }
//       )
//       .then((response) => {
//         Cookies.remove("access_token");
//         setIsLoggedIn(false);
//       })
//       .catch((error) => console.log(error));
//   };

//   return (
//     <div>
//       {isLoggedIn ? (
//         <div>
//           <h1>You are logged in!</h1>
//           <Button label="Refresh" onClick={handleRefresh} />
//           <Button label="Logout" onClick={handleLogout} />

//           <div className="p-field">
//             <label htmlFor="email">Email</label>
//             <InputText
//               id="email"
//               value={email}
//               onChange={(e) => setEmail(e.target.value)}
//             />
//           </div>
//           <div className="p-field">
//             <label htmlFor="password">Password</label>
//             <InputText
//               id="password"
//               value={password}
//               onChange={(e) => setPassword(e.target.value)}
//             />
//           </div>
//           <Button label="Login" onClick={handleLogin} />
//         </div>
//       ) : (
//         <div>
//           <div className="p-field">
//             <label htmlFor="email">Email</label>
//             <InputText
//               id="email"
//               value={email}
//               onChange={(e) => setEmail(e.target.value)}
//             />
//           </div>
//           <div className="p-field">
//             <label htmlFor="password">Password</label>
//             <InputText
//               id="password"
//               value={password}
//               onChange={(e) => setPassword(e.target.value)}
//             />
//           </div>
//           <Button label="Login" onClick={handleLogin} />
//         </div>
//       )}
//     </div>
//   );
// };

// export default Login;

// import superagent from "superagent";
// import Cookies from "js-cookie";
// import { useState } from "react";
// import { Button } from "primereact/button";

// function Login() {
//   const [email, setEmail] = useState("");
//   const [password, setPassword] = useState("");
//   const [isLoggedIn, setIsLoggedIn] = useState(false);

//   const handleLogin = async (e) => {
//     e.preventDefault();
//     try {
//       const res = await superagent
//         .post("https://api.sampurna-group.com/v2/users/login")
//         .send({ email, password })
//         .withCredentials();

//       // Save cookies to browser's cookie storage
//       const cookiess = res.headers["set-cookie"];
//       console.log(res.headers);
//       cookiess.forEach((cookie) => {
//         const [name, value] = cookie.split(";")[0].split("=");
//         Cookies.set(name, value);
//       });
//       setIsLoggedIn(true);
//       console.log("Login successful!");

//       // Perform any necessary actions after successful login
//     } catch (err) {
//       console.error(err);
//     }
//   };

//   const handleRefresh = () => {
//     const refreshToken = Cookies.get("refreshToken");
//     if (!refreshToken) {
//       console.error("No refresh token found in cookies");
//       return;
//     }

//     try {
//       const res = superagent
//         .post("https://api.sampurna-group.com/v2/users/refresh")
//         .set("Authorization", `Bearer ${refreshToken}`)
//         .withCredentials();

//       // Save updated access token to cookies
//       const accessToken = res.body.accessToken;
//       Cookies.set("accessToken", accessToken);

//       console.log("Token refreshed successfully!");
//     } catch (err) {
//       console.error(err);
//     }
//   };

//   const handleLogout = () => {
//     const accessToken = Cookies.get("accessToken");
//     const refreshToken = Cookies.get("refreshToken");

//     // Delete stored access and refresh tokens
//     Cookies.remove("accessToken");
//     Cookies.remove("refreshToken");

//     try {
//       const res = superagent
//         .post("https://api.sampurna-group.com/v2/users/logout")
//         .set("Authorization", `Bearer ${accessToken}`)
//         .send({ refreshToken })
//         .withCredentials();

//       console.log("Logout successful!");
//     } catch (err) {
//       console.error(err);
//     }
//   };

//   return (
//     <div>
//       {isLoggedIn ? (
//         <div>
//           <h1>You are logged in!</h1>
//           <Button label="Refresh" onClick={handleRefresh} />
//           <Button label="Logout" onClick={handleLogout} />
//         </div>
//       ) : (
//         <form>
//           <label>
//             Email:
//             <input
//               type="email"
//               value={email}
//               onChange={(e) => setEmail(e.target.value)}
//             />
//           </label>
//           <label>
//             Password:
//             <input
//               type="password"
//               value={password}
//               onChange={(e) => setPassword(e.target.value)}
//             />
//           </label>
//           <Button label="Login" onClick={handleLogin} />
//         </form>
//       )}
//     </div>
//   );
// }

// export default Login;

//

// import { useState } from "react";
// import { useAtom } from "jotai";
// import { InputText } from "primereact/inputtext";
// import { Button } from "primereact/button";
// import Cookies from "js-cookie";

// const Login = () => {
//   const [email, setEmail] = useState("");
//   const [password, setPassword] = useState("");
//   const tokenState = useAtom(tokenAtom); // tokenAtom is defined using createStateLink

//   const handleSubmit = async (event) => {
//     event.preventDefault();
//     const response = await fetch(
//       "https://api.sampurna-group.com/v2/users/login",
//       {
//         method: "POST",
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: JSON.stringify({
//           email,
//           password,
//         }),
//       }
//     );
//     if (response.ok) {
//       const data = await response.json();
//       Cookies.set("access_token", data.access_token);
//       Cookies.set("refresh_token", data.refresh_token);
//       tokenState.set(data.access_token);
//     }
//   };

//   const handleRefresh = async () => {
//     const response = await fetch(
//       "https://api.sampurna-group.com/v2/users/refresh",
//       {
//         method: "POST",
//         headers: {
//           "Content-Type": "application/json",
//           Authorization: `Bearer ${Cookies.get("refresh_token")}`,
//         },
//       }
//     );
//     if (response.ok) {
//       const data = await response.json();
//       Cookies.set("access_token", data.access_token);
//       tokenState.set(data.access_token);
//     }
//   };

//   const handleLogout = async () => {
//     const response = await fetch(
//       "https://api.sampurna-group.com/v2/users/logout",
//       {
//         method: "POST",
//         headers: {
//           "Content-Type": "application/json",
//           Authorization: `Bearer ${Cookies.get("access_token")}`,
//         },
//       }
//     );
//     if (response.ok) {
//       Cookies.remove("access_token");
//       Cookies.remove("refresh_token");
//       tokenState.set(null);
//     }
//   };

//   return (
//     <div>
//       <form onSubmit={handleSubmit}>
//         <div>
//           <label htmlFor="email">Email</label>
//           <InputText
//             id="email"
//             value={email}
//             onChange={(e) => setEmail(e.target.value)}
//           />
//         </div>
//         <div>
//           <label htmlFor="password">Password</label>
//           <InputText
//             id="password"
//             type="password"
//             value={password}
//             onChange={(e) => setPassword(e.target.value)}
//           />
//         </div>
//         <Button type="submit" label="Login" />
//       </form>
//       <div>
//         <Button onClick={handleRefresh} label="Refresh" />
//         <Button onClick={handleLogout} label="Logout" />
//       </div>
//     </div>
//   );
// };

// export default Login;

// import { hookstate } from "@hookstate/core";
// import { Button } from "primereact/button";
// import { InputText } from "primereact/inputtext";

// const Login = () => {
//   const emailLink = hookstate("");
//   const passwordLink = hookstate("");
//   const cookieState = hookstate("");

//   const handleLogin = async () => {
//     try {
//       const response = await fetch(
//         "https://api.sampurna-group.com/v2/users/login",
//         {
//           method: "POST",
//           headers: {
//             "Content-Type": "application/json",
//           },
//           body: JSON.stringify({
//             email: emailLink.value,
//             password: passwordLink.value,
//           }),
//         }
//       );

//       // Extract cookies from response headers
//       const cookies = response.headers.get("set-cookie");
//       cookieState.set(cookies);

//       // Save cookies to browser cookies
//       document.cookie = cookies;
//     } catch (error) {
//       console.error(error);
//     }
//   };

//   const handleLogout = async () => {
//     try {
//       const response = await fetch(
//         "https://api.sampurna-group.com/v2/users/logout",
//         {
//           method: "POST",
//           headers: {
//             "Content-Type": "application/json",
//             Cookie: cookieState.value,
//           },
//         }
//       );

//       // Clear the saved cookie
//       console.log(response);
//       cookieState.set("");
//       document.cookie = "";
//     } catch (error) {
//       console.error(error);
//     }
//   };

//   const handleRefresh = async () => {
//     try {
//       const response = await fetch(
//         "https://api.sampurna-group.com/v2/users/refresh",
//         {
//           method: "POST",
//           headers: {
//             "Content-Type": "application/json",
//             Cookie: cookieState.value,
//           },
//         }
//       );

//       // Update the cookies with the refreshed token
//       const cookies = response.headers.get("set-cookie");
//       cookieState.set(cookies);
//       document.cookie = cookies;
//     } catch (error) {
//       console.error(error);
//     }
//   };

//   return (
//     <div>
//       <div className="p-field">
//         <label htmlFor="email">Email</label>
//         <InputText
//           id="email"
//           type="email"
//           value={emailLink.value}
//           onChange={(e) => emailLink.set(e.target.value)}
//         />
//       </div>
//       <div className="p-field">
//         <label htmlFor="password">Password</label>
//         <InputText
//           id="password"
//           type="password"
//           value={passwordLink.value}
//           onChange={(e) => passwordLink.set(e.target.value)}
//         />
//       </div>
//       <Button label="Login" onClick={handleLogin} />
//       <Button label="Logout" onClick={handleLogout} />
//       <Button label="Refresh" onClick={handleRefresh} />
//     </div>
//   );
// };

// export default Login;

// import React, { useState } from "react";
// import { InputText } from "primereact/inputtext";
// import { Button } from "primereact/button";
// import { Message } from "primereact/message";
// import { useHookstate } from "@hookstate/core";
// import axios from "axios";
// import Cookies from "js-cookie";

// const Login = () => {
//   const emailLink = useHookstate("");
//   const passwordLink = useHookstate("");
//   const [error, setError] = useState("");
//   const [isLoggedIn, setIsLoggedIn] = useState(false);
//   const url = "https://api.sampurna-group.com/v2/users";
//   const cookiesState = useHookstate(Cookies.get("cookies") || null);

//   const handleSubmit = async (event) => {
//     event.preventDefault();

//     try {
//       const response = await axios.post(
//         `${url}/login`,
//         {
//           email: emailLink.value,
//           password: passwordLink.value,
//         },
//         {
//           withCredentials: true, // enables cookies to be sent with the request
//         }
//       );
//       localStorage.setItem("token", response.data.session_id);
//       console.log(localStorage);
//       console.log(response);
//       setIsLoggedIn(true);
//       setError("");
//     } catch (err) {
//       setError("Invalid email or password");
//     }
//   };

//   //   const handleSubmit = async (event) => {
//   //     event.preventDefault();
//   //     const email = emailLink.value; // get email input value;
//   //     const password = passwordLink.value; // get password input value;

//   //     try {
//   //       const response = await axios.post(
//   //         "https://api.sampurna-group.com/v2/users/login",
//   //         {
//   //           headers: {
//   //             Cookie: cookiesState.get(), // get cookies from the state and add to the request headers
//   //           },
//   //         },
//   //         { email, password }
//   //       );
//   //       const cookies = response.headers["set-cookie"];
//   //       Cookies.set("cookies", cookies);
//   //       console.log(response);
//   //       // save cookies to browser cookies with the key 'cookies'
//   //       // navigate to the next page or update the UI based on login success
//   //     } catch (error) {
//   //       // handle error
//   //     }
//   //   };

//   const handleRefreshToken = async () => {
//     try {
//       const response = await axios.post(
//         "https://api.sampurna-group.com/v2/users/refresh",
//         {},
//         {
//           headers: {
//             Cookie: cookiesState.get(), // add cookies to the request headers
//           },
//         }
//       );
//       const cookies = response.headers["set-cookie"];
//       Cookies.set("cookies", cookies); // save updated cookies to browser cookies
//       cookiesState.set(cookies); // update cookies in the application state
//     } catch (error) {
//       // handle error
//     }
//     // try {
//     //   let sessionId = localStorage.getItem("token");
//     //   //   if (token !== null) {
//     //   //     axios.defaults.headers["token"] = sessionId;
//     //   //     await axios.post(`${url}/refresh`);
//     //   //     let response = await axios.post(`${url}/refresh`);
//     //   //     console.log(response);
//     //   //   }
//     //   const response = await axios.post(
//     //     `${url}/refresh`,
//     //     {},
//     //     {
//     //       withCredentials: true, // enables cookies to be sent with the request
//     //     }
//     //   );
//     //   console.log(localStorage.getItem("token"));
//     //   console.log(response.data);
//     //   localStorage.getItem("token", response.data.session_id);
//     //   setIsLoggedIn(true);
//     // } catch (err) {
//     //   setError("Unable to refresh token");
//     // }
//   };

//   const handleLogout = async () => {
//     try {
//       await axios.post(
//         `${url}/logout`,
//         {},
//         {
//           withCredentials: true, // enables cookies to be sent with the request
//         }
//       );
//       localStorage.removeItem("token");
//       setIsLoggedIn(false);
//     } catch (err) {
//       setError("Unable to log out");
//     }
//   };

//   // check if user is already logged in by checking for token in local storage
//   if (localStorage.getItem("token") && !isLoggedIn) {
//     setIsLoggedIn(true);
//   }

//   return (
//     <div className="p-fluid p-mt-5">
//       {!isLoggedIn ? (
//         <form onSubmit={handleSubmit}>
//           <div className="p-field">
//             <label htmlFor="email">Email</label>
//             <InputText
//               id="email"
//               type="email"
//               value={emailLink.value}
//               onChange={(e) => emailLink.set(e.target.value)}
//             />
//           </div>
//           <div className="p-field">
//             <label htmlFor="password">Password</label>
//             <InputText
//               id="password"
//               type="password"
//               value={passwordLink.value}
//               onChange={(e) => passwordLink.set(e.target.value)}
//             />
//           </div>
//           <Button type="submit" label="Login" className="p-mt-3" />
//           {error && <Message severity="error" text={error} />}
//         </form>
//       ) : (
//         <div>
//           <p>You are logged in</p>
//           <Button
//             onClick={handleRefreshToken}
//             label="Refresh Token"
//             className="p-mr-3"
//           />
//           <Button onClick={handleLogout} label="Logout" />
//         </div>
//       )}
//     </div>
//   );
// };

// export default Login;

// import React, { useState } from "react";
// import axios from "axios";
// import { InputText } from "primereact/inputtext";
// import { Button } from "primereact/button";
// import { useHistory } from "react-router-dom";
// import { useAtom } from "hookstate";

// const Login = () => {
//   const [email, setemail] = useState("");
//   const [password, setPassword] = useState("");
//   const history = useHistory();
//   const authState = useAtom(authAtom);

//   const handleLogin = async () => {
//     try {
//       const response = await axios.post(
//         "https://api.sampurna-group.com/v2/users/login",
//         { email, password },
//         { withCredentials: true }
//       );
//       if (response.status === 200) {
//         authState.set({ ...authState.get(), isLoggedIn: true });
//         history.push("/");
//       }
//     } catch (error) {
//       console.error(error);
//     }
//   };

//   return (
//     <div>
//       <div className="p-inputgroup">
//         <span className="p-inputgroup-addon">
//           <i className="pi pi-user"></i>
//         </span>
//         <InputText
//           placeholder="email"
//           value={email}
//           onChange={(e) => setemail(e.target.value)}
//         />
//       </div>
//       <div className="p-inputgroup">
//         <span className="p-inputgroup-addon">
//           <i className="pi pi-lock"></i>
//         </span>
//         <InputText
//           type="password"
//           placeholder="Password"
//           value={password}
//           onChange={(e) => setPassword(e.target.value)}
//         />
//       </div>
//       <Button label="Login" icon="pi pi-sign-in" onClick={handleLogin} />
//     </div>
//   );
// };

// export default Login;

// import React, { useState } from "react";
// import { Button } from "primereact/button";
// import { InputText } from "primereact/inputtext";
// import { Card } from "primereact/card";
// import { Divider } from "primereact/divider";
// import { useHookstate } from "@hookstate/core";

// const Login = () => {
//   const email = useHookstate("");
//   const password = useHookstate("");
//   const cookies = useHookstate(document.cookie);

//   const handleLogin = async () => {
//     const response = await fetch(
//       "https://api.sampurna-group.com/v2/users/login",
//       {
//         method: "POST",
//         body: JSON.stringify({
//           email: email.value,
//           password: password.value,
//         }),
//         headers: {
//           "Content-Type": "application/json",
//         },
//       }
//     );

//     if (response.ok) {
//       const setCookie = response.headers.get("set-cookie");
//       cookies.set(setCookie);
//       console.log("Logged in successfully!");
//       console.log(response.headers);
//     } else {
//       console.error("Login failed!");
//     }
//   };

//   const handleLogout = async () => {
//     await fetch("https://api.sampurna-group.com/v2/users/logout", {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         Cookie: cookies.get(),
//       },
//     });

//     cookies.set("");
//     console.log("Logged out successfully!");
//   };

//   return (
//     <div className="p-d-flex p-jc-center p-mt-5">
//       <Card title="Login">
//         <div className="p-fluid">
//           <div className="p-field">
//             <label htmlFor="email">email</label>
//             <InputText
//               id="email"
//               type="text"
//               value={email.value}
//               onChange={(e) => email.set(e.target.value)}
//             />
//           </div>
//           <div className="p-field">
//             <label htmlFor="password">Password</label>
//             <InputText
//               id="password"
//               type="password"
//               value={password.value}
//               onChange={(e) => password.set(e.target.value)}
//             />
//           </div>
//         </div>
//         <Divider />
//         <div className="p-d-flex p-jc-between">
//           <Button label="Login" onClick={handleLogin} />
//           <Button label="Logout" onClick={handleLogout} />
//         </div>
//       </Card>
//     </div>
//   );
// };

// export default Login;
