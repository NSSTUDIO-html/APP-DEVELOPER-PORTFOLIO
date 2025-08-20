import React from 'react';
import { View, Text, ScrollView, TouchableOpacity, Linking, StyleSheet } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';

const Tab = createBottomTabNavigator();

// Sample projects
const projects = [
  { name: 'E-commerce App', link: 'https://github.com/yourusername/ecommerce' },
  { name: 'Ride Booking App', link: 'https://github.com/yourusername/ride-booking' },
  { name: 'Fitness Tracker', link: 'https://github.com/yourusername/fitness' },
  { name: 'Video Streaming', link: 'https://github.com/yourusername/video-stream' },
  { name: 'AI Face Filters', link: 'https://github.com/yourusername/ai-filters' },
];

const HomeScreen = () => (
  <ScrollView style={styles.container}>
    <Text style={styles.title}>ProX Hub</Text>
    <Text style={styles.subtitle}>Your Name - App Developer</Text>
    <Text style={styles.sectionTitle}>About Me</Text>
    <Text style={styles.text}>
      I am a passionate app developer building mobile apps with React Native, AI features, AR tools, and more.
    </Text>
  </ScrollView>
);

const ProjectsScreen = () => {
  const openLink = (url) => Linking.openURL(url).catch(err => console.error('Failed to open URL:', err));

  return (
    <ScrollView style={styles.container}>
      <Text style={styles.sectionTitle}>Projects</Text>
      {projects.map((project, index) => (
        <TouchableOpacity key={index} onPress={() => openLink(project.link)}>
          <Text style={styles.link}>{project.name}</Text>
        </TouchableOpacity>
      ))}
    </ScrollView>
  );
};

const ContactScreen = () => (
  <ScrollView style={styles.container}>
    <Text style={styles.sectionTitle}>Contact</Text>
    <Text style={styles.text}>Email: your.email@example.com</Text>
    <Text style={styles.text}>Phone: +1234567890</Text>
  </ScrollView>
);

export default function App() {
  return (
    <NavigationContainer>
      <Tab.Navigator
        screenOptions={{
          headerShown: false,
          tabBarStyle: { backgroundColor: '#1a1a1a' },
          tabBarActiveTintColor: '#00ffff',
          tabBarInactiveTintColor: '#888',
        }}
      >
        <Tab.Screen name="Home" component={HomeScreen} />
        <Tab.Screen name="Projects" component={ProjectsScreen} />
        <Tab.Screen name="Contact" component={ContactScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#121212',
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#00ffff',
    textAlign: 'center',
    marginBottom: 10,
  },
  subtitle: {
    fontSize: 18,
    color: '#fff',
    textAlign: 'center',
    marginBottom: 20,
  },
  sectionTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#00ffff',
    marginBottom: 10,
  },
  text: {
    fontSize: 16,
    color: '#fff',
    lineHeight: 24,
    marginBottom: 15,
  },
  link: {
    fontSize: 16,
    color: '#ff8c00',
    marginBottom: 10,
    textDecorationLine: 'underline',
  },
});