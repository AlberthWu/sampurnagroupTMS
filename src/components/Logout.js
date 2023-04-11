import superagent from "superagent";
import Cookies from "js-cookie";
import { useState } from "react";
async function logout() {
  const accessToken = Cookies.get("accessToken");
  const refreshToken = Cookies.get("refreshToken");

  // Delete stored access and refresh tokens
  Cookies.remove("accessToken");
  Cookies.remove("refreshToken");

  try {
    const res = await superagent
      .post("https://api.sampurna-group.com/v2/users/logout")
      .set("Authorization", `Bearer ${accessToken}`)
      .send({ refreshToken })
      .withCredentials();

    console.log("Logout successful!");
  } catch (err) {
    console.error(err);
  }
}

export default logout;
