#!/bin/bash

# spamassasin update and spam learning
sa-learn --spam ~/.kde/share/apps/kmail/mail/spam/cur/*
sa-learn --ham ~/.kde/share/apps/kmail/dimap/.91678089.directory/archive/cur/*
