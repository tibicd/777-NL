import datetime
import time
import requests
from playwright.sync_api import sync_playwright, TimeoutError as PlaywrightTimeoutError


class PlaywrightKeywords:
    def __init__(self):
        self.base_url = None

    def create_api_session(self, base_url):
        self.base_url = base_url

    def perform_post_request(self, endpoint, data):
        response = requests.post(self.base_url + endpoint, json=data)
        return response

    def perform_put_request(self, endpoint, data):
        response = requests.put(self.base_url + endpoint, json=data)
        return response

    def perform_delete_request(self, endpoint):
        response = requests.delete(self.base_url + endpoint)
        return response

    def perform_get_request(self, endpoint):
        response = requests.get(self.base_url + endpoint)
        return response

keywords = PlaywrightKeywords()

def create_api_session(base_url):
    keywords.create_api_session(base_url)

def perform_post_request(endpoint, data):
    return keywords.perform_post_request(endpoint, data)

def perform_put_request(endpoint, data):
    return keywords.perform_put_request(endpoint, data)

def perform_delete_request(endpoint):
    return keywords.perform_delete_request(endpoint)

def perform_get_request(endpoint):
    return keywords.perform_get_request(endpoint)


class PlaywrightKeywords:
    def __init__(self):
        self.base_url = None

    def create_api_session(self, base_url):
        self.base_url = base_url

    def perform_post_request(self, endpoint, data):
        response = requests.post(self.base_url + endpoint, json=data)
        return response

keywords = PlaywrightKeywords()

def create_api_session(base_url):
    keywords.create_api_session(base_url)

def perform_post_request(endpoint, data):
    return keywords.perform_post_request(endpoint, data)

class PlaywrightKeywords:
    def __init__(self):
        self.playwright = None
        self.browser = None
        self.page = None

    def open_browser(self):
        self.playwright = sync_playwright().start()
        self.browser = self.playwright.chromium.launch(headless=False)
        context = self.browser.new_context()
        self.page = context.new_page()

    def close_browser(self):
        if self.browser:
            self.browser.close()
        if self.playwright:
            self.playwright.stop()

    def navigate(self, url):
        self.page.goto(url)

    def fill_input(self, selector, value):
        self.page.fill(selector, value)

    def click_element(self, selector):
        self.page.click(selector)

    def wait_for_selector(self, selector, timeout=10000):
        try:
            self.page.wait_for_selector(selector, timeout=timeout)
        except PlaywrightTimeoutError:
            raise AssertionError(f"Element with selector {selector} not found within {timeout}ms")

    def wait_for_element_visible(self, selector, timeout=10000):
        try:
            self.page.wait_for_selector(selector, state='visible', timeout=timeout)
        except PlaywrightTimeoutError:
            raise AssertionError(f"Element with selector {selector} not visible within {timeout}ms")

    def wait_for_element_enabled(self, selector, timeout=10000):
        try:
            self.page.wait_for_selector(selector, state='enabled', timeout=timeout)
        except PlaywrightTimeoutError:
            raise AssertionError(f"Element with selector {selector} not enabled within {timeout}ms")

    def wait_for_page_load(self, timeout=30000):
        try:
            self.page.wait_for_load_state('load', timeout=timeout)
        except PlaywrightTimeoutError:
            raise AssertionError(f"Page did not load within {timeout}ms")

    def wait_until_element_contains_text(self, selector, text, timeout=10000):
        try:
            self.page.wait_for_selector(selector, state='visible', timeout=timeout)
            self.page.wait_for_function(f'document.querySelector("{selector}").innerText.includes("{text}")', timeout=timeout)
        except PlaywrightTimeoutError:
            raise AssertionError(f"Element with selector {selector} did not contain text '{text}' within {timeout}ms")

    def set_timeout(self, timeout):
        self.page.set_default_timeout(timeout)

    def handle_alert(self):
        self.page.on("dialog", lambda dialog: dialog.accept())

    def check_element_existence(self, selector):
        try:
            self.page.wait_for_selector(selector, timeout=1000)
        except PlaywrightTimeoutError:
            raise AssertionError(f"Element with selector {selector} does not exist")

    def assert_element_text(self, selector, expected_text):
        element_text = self.page.text_content(selector)
        if element_text != expected_text:
            raise AssertionError(f"Expected text '{expected_text}', but got '{element_text}'")

    def capture_screenshot(self, name):
        print(f"Screenshot saved: {name}")
        self.page.screenshot(path=name)

    def retry_keyword(self, keyword, attempts):
        for index in range(int(attempts)):
            try:
                keyword()
                print(index)
                break
            except Exception as e:
                last_exception = e
        else:
            raise last_exception

    def wait_for_network_idle(self, idle_time):
        self.page.wait_for_load_state('networkidle', timeout=idle_time)

    def new_browser_context(self):
        context = self.browser.new_context()
        self.page = context.new_page()


    def get_all_elements_text(self, selector):
        elements = self.page.query_selector_all(selector)
        return [element.inner_text() for element in elements]

    def click_all_add_to_cart_buttons(self, selector):
        buttons = self.page.query_selector_all(selector)
        for button in buttons:
            button.click()
            time.sleep(1)
        return len(buttons)

    def get_shopping_cart_badge_text(self, selector):
        element = self.page.query_selector(selector)
        return element.inner_text() if element else None

        # API Methods

    def create_api_session(self, base_url):
        self.base_url = base_url

    def perform_get_request(self, endpoint):
        response = requests.get(self.base_url + endpoint)
        return response

    def perform_post_request(self, endpoint, data):
        response = requests.post(self.base_url + endpoint, json=data)
        return response

    def perform_put_request(self, endpoint, data):
        response = requests.put(self.base_url + endpoint, json=data)
        return response

    def perform_delete_request(self, endpoint):
        response = requests.delete(self.base_url + endpoint)
        return response


# Instantiate the PlaywrightKeywords class to make the keywords accessible
keywords = PlaywrightKeywords()

# Define the keyword functions to be used in Robot Framework
def open_browser():
    keywords.open_browser()

def close_browser():
    keywords.close_browser()

def navigate(url):
    keywords.navigate(url)

def fill_input(selector, value):
    keywords.fill_input(selector, value)

def click_element(selector):
    keywords.click_element(selector)

def wait_for_selector(selector):
    keywords.wait_for_selector(selector)

def wait_for_element_visible(selector):
    keywords.wait_for_element_visible(selector)

def wait_for_element_enabled(selector):
    keywords.wait_for_element_enabled(selector)

def wait_for_page_load():
    keywords.wait_for_page_load()

def wait_until_element_contains_text(selector, text):
    keywords.wait_until_element_contains_text(selector, text)

def set_timeout(timeout):
    keywords.set_timeout(timeout)

def handle_alert():
    keywords.handle_alert()

def check_element_existence(selector):
    keywords.check_element_existence(selector)

def assert_element_text(selector, expected_text):
    keywords.assert_element_text(selector, expected_text)

def capture_screenshot(filename):
    keywords.capture_screenshot(filename)

def retry_keyword(keyword, attempts):
    keywords.retry_keyword(keyword, attempts)

def wait_for_network_idle(idle_time):
    keywords.wait_for_network_idle(idle_time)

def new_browser_context():
    keywords.new_browser_context()

def get_all_elements_text(selector):
    return keywords.get_all_elements_text(selector)

def click_all_add_to_cart_buttons(selector):
    return keywords.click_all_add_to_cart_buttons(selector)

def get_shopping_cart_badge_text(selector):
    return keywords.get_shopping_cart_badge_text(selector)

# API keyword functions
def create_api_session(base_url):
    keywords.create_api_session(base_url)

def perform_get_request(endpoint):
    return keywords.perform_get_request(endpoint)

def perform_post_request(endpoint, data):
    return keywords.perform_post_request(endpoint, data)

def perform_put_request(endpoint, data):
    return keywords.perform_put_request(endpoint, data)

def perform_delete_request(endpoint):
    return keywords.perform_delete_request(endpoint)