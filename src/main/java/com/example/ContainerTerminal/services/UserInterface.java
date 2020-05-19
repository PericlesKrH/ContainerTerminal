/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.ContainerTerminal.services;

import com.example.ContainerTerminal.models.User;


public interface UserInterface {
 public User findByUsername(String username);
 
 public void insertUser(User u);
 public User findById(Integer id);
 public void updateUser(User u);

}
